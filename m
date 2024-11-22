Return-Path: <linux-i2c+bounces-8157-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7459D603B
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 15:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 624E5B22111
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 14:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6542E40B;
	Fri, 22 Nov 2024 14:14:48 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7258BE7
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732284888; cv=none; b=qZeTrTyPleTj4h0bWAs3e/qfClLs/fH07RjxJm99MXIM3nb6KCj2IPKES0pyNHLB0RL3/Utq6dD8AyEM5CujCjyQdlJSagLmb82KazLSIXYZ65ojT6VKASJW/uCGaUtU3f+Ozjd5wIt/Vo8PcMCjWeRPmwq1A+TMKtDoh0NxYck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732284888; c=relaxed/simple;
	bh=+JE59zWeC4WSlqbAasDBCBKZyrM9xpQjDT0EPOeoAbY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jLZ5ngycA55U296KQ0UrtkNTTwZX0FNgCehlzLvqSVWa3k0zhY8FIvgGWFKZogFiK/5TH9d5TG7tErmFBNtSY6+Fi/hydcJjO7qq0w43iKj62OXgCHxaWE1fw9QRzpag08tRMEoBlrj+XqaXW56/uG4FcfEoEHXNi1cVPaCAoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:f5fb:8e63:7b7f:44ee])
	by xavier.telenet-ops.be with cmsmtp
	id fqEd2D00P1FERHE01qEdP1; Fri, 22 Nov 2024 15:14:38 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tEUQH-007izP-AQ;
	Fri, 22 Nov 2024 15:14:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tEUQf-005rdq-EC;
	Fri, 22 Nov 2024 15:14:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Chris Brandt <chris.brandt@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Adam Ford <aford173@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] i2c: riic: Always round-up when calculating bus period
Date: Fri, 22 Nov 2024 15:14:35 +0100
Message-Id: <c59aea77998dfea1b4456c4b33b55ab216fcbf5e.1732284746.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the RIIC driver may run the I2C bus faster than requested,
which may cause subtle failures.  E.g. Biju reported a measured bus
speed of 450 kHz instead of the expected maximum of 400 kHz on RZ/G2L.

The initial calculation of the bus period uses DIV_ROUND_UP(), to make
sure the actual bus speed never becomes faster than the requested bus
speed.  However, the subsequent division-by-two steps do not use
round-up, which may lead to a too-small period, hence a too-fast and
possible out-of-spec bus speed.  E.g. on RZ/Five, requesting a bus speed
of 100 resp. 400 kHz will yield too-fast target bus speeds of 100806
resp. 403226 Hz instead of 97656 resp. 390625 Hz.

Fix this by using DIV_ROUND_UP() in the subsequent divisions, too.

Tested on RZ/A1H, RZ/A2M, and RZ/Five.

Fixes: d982d66514192cdb ("i2c: riic: remove clock and frequency restrictions")
Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Apart from the rounding issue fixed by this patch, I could not find any
bugs in the calculation of the various parameters (based on the formulas
in the documentation).  Still, the actual (measured) bus speed may still
be higher than the target bus speed.  Hence this patch is not sufficient
to reduce the actual bus speed to safe levels, and I have not yet addded

    Closes: https://lore.kernel.org/TYCPR01MB11269BFE7A9D3DC605BA2A2A9864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com/

On RZ/A1H (RSK+RZA1):

              speed    actual  duty  fall  rise  cks  brl  brh
             ------  --------  ----  ----  ----  ---  ---  ---
    before:  101600   113 kHz    63     1     4    3   20   10
    after:    99181   110 kHz    64     1     4    3   21   10

    before:  396726   407 kHz    62     5     5    1   17    9
    after:   396726   407 kHz    62     5     5    1   17    9

    Note that before commit d982d66514192cdb, the actual values were
    within spec, so probably the parameters were hand-tuned with the
    help of scope:
             101600    99.2 kHz  63     1     4    3   19   16
	     396726   370   kHz  62     5     5    1   21    9

RZ/A2M (RZA2MEVB):

              speed    actual  duty  fall  rise  cks  brl  brh
             ------  --------  ----  ----  ----  ---  ---  ---
    before:  100609   115 kHz    63     1     4    4   20   10
    after:    98214   111 kHz    64     1     4    4   21   10

    before:  402439   459 kHz    61     5     5    2   16    9
    after:   392857   446 kHz    62     5     5    2   17    9

RZ/Five (RZ/Five  SMARC):

              speed    actual  duty  fall  rise  cks  brl  brh
             ------  --------  ----  ----  ----  ---  ---  ---
    before:  100806   112 kHz    64     0     3    5   15    7
    after:    97656   108 kHz    65     0     3    5   16    7

    before:  403225   446 kHz    60     3     3    3   12    7
    after:   390625   431 kHz    61     3     3    3   13    7

I.e. the actual bus speed is still up to 10% higher than requested.

The driver assumes the default register settings:
  - FER.SCLE = 1 (SCL sync circuit enabled, adds 2 or 3 cycles)
  - FER.NFE = 1 (noise circuit enabled)
  - MR3.NF = 0 (1 cycle of noise filtered out)
As these are not explicitly set by the driver, I verified that the
assumptions are true on all affected platforms.

I also tried disabling FER.SCLE and removing the compensation for SCLE
on RZ/Five.  For a bus speed of 100 kHz, that gave:

              speed    actual     duty  fall  rise  cks  brl  brh
             ------  ----------   ----  ----  ----  ---  ---  ---
    before:   97656   108   kHz   65     0     3    5   16    7
    after:    97656    94.7 kHz   63     0     3    5   18    9

which looks better, but obviously the SCL sync circuit must add some
value?

So it looks like the default values provided by i2c_parse_fw_timings()
do not work well for us, and all board DTS files should provide suitable
values explicitly, using the "i2c-scl-rising-time-ns" and
"i2c-scl-falling-time-ns" properties.
Adam submitted something similar for R-Car a while ago[1].

Thanks for your comments!

[1] "[PATCH] arm64: dts: renesas: beacon: Fix i2c2 speed calcuation"
    https://lore.kernel.org/20210825122757.91133-1-aford173@gmail.com
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 0c2342f86d3d2fbe..a6aeb40aae04d607 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -352,7 +352,7 @@ static int riic_init_hw(struct riic_dev *riic)
 		if (brl <= (0x1F + 3))
 			break;
 
-		total_ticks /= 2;
+		total_ticks = DIV_ROUND_UP(total_ticks, 2);
 		rate /= 2;
 	}
 
-- 
2.34.1


