Return-Path: <linux-i2c+bounces-1929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1649860522
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 22:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70F371F24173
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 21:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8593812D1F8;
	Thu, 22 Feb 2024 21:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b="nohRBohm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63373F05;
	Thu, 22 Feb 2024 21:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708638651; cv=none; b=eNxMP1KM/1fXuKkEYlvPWbiO2drnnVdgB7mCwBbw/pYs9iSQaLrByLnezxzmjntJO8EPZ/YICJ9bRS2OKlkplZa0TeUrew1Gn+px77HfBy6ErIaX6shj/JIWRWIlIYFCWhKZVQbhegOmW+3ixLFQZON+PWntcI5PHEo0I/tdp+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708638651; c=relaxed/simple;
	bh=9ZuRxkDK5H19iw6y42gY5WWcNAPljW3IVJTRFThvddQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T7rzLWl796PGAAoSYjTrI8nqFmQTYiivQx4TGPOmvt2HgKEa1P6S7hw6AnQL8AIWQNkZ/RNKzI//9KWTettQsvEsAiNRj2pc2siF3UHoQF/0cGy0I7fG9cKAZQYXP45/zGMTCD258FNvdZJN0meOyxAJgGJfASfzl6JyBCkcEGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hoehnp@gmx.de header.b=nohRBohm; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1708638635; x=1709243435; i=hoehnp@gmx.de;
	bh=9ZuRxkDK5H19iw6y42gY5WWcNAPljW3IVJTRFThvddQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=nohRBohm5Vs2iN/yG3D7yJKGIpjc4vvk+MXeesmxO/unLNEAMqO+TE2DbuO+VRpP
	 5SFRd8EOoBwmMNUwwlfD6u51JjamjqqviTItxB2uAIelSND7MxTr+Rtbyf0mFIfRi
	 HmQ7yu0W9wk8slia8dwTY3whE6smsWroH4Vk3t2zqRehnAqV9zhvfJ2V5Y8GnWQZl
	 nbv03tm4FF95t3tIe4mI2M1aMtm0ZLVItkrLBJvsKiK9q9cqSlaJQelyfrNdmZKUz
	 xwJ0MbwhRS34zem4sml09p8rbPrma6kgpcKoEOU5TSeDj4bDFSL31cj0lBmaoA1J5
	 4kHODSyqE6umIHYKhQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from patrick-dell.lan ([31.18.168.131]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17Ye-1qwlPc3rXm-012aib; Thu, 22
 Feb 2024 22:50:35 +0100
From: =?UTF-8?q?Patrick=20H=C3=B6hn?= <hoehnp@gmx.de>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	=?UTF-8?q?Patrick=20H=C3=B6hn?= <hoehnp@gmx.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: i801: Add lis3lv02d for Dell Precision M6800 v2 Bios: A26
Date: Thu, 22 Feb 2024 22:50:08 +0100
Message-ID: <20240222215010.31456-1-hoehnp@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PTbtMT18fAIFxF/WVReDFqsYPgDxOWxtV/YSEMIe+D9c5s7lvws
 nnLpm6kiduy/Z1DgZEiJ/NaeAI52RhoPsyPujbZvAsbPwdOCstC7KS+V8/cwq5lj85DNR0N
 1r18Ez30+TeLEV28CDFBeY/J7I8ugy+e6yVy2LQ2zCf/LMp/OD8WJLZiaYX0FeTRvoTs+qr
 CP+W1MNEDmooBOmjQRIFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ENfj41CSwwk=;eo0DRdun3Q6jkAym3pU+uELER+q
 v0/UUR+VZa2ggKFUPrzqP9RmjwMqCCOVV1seccu/HrTUkQVAiJS9LXzgpquwWah+OY/QVzdFH
 jCl05a0BlaiVymhrhKVgKymWZyz++f4eYUFGKnKncyNe2o7ZahZkqf6ru1J7wKJVhB9kZbelk
 UugvpJ8sf3DuY7v9tsxL/5bFEB1gW2AXFlPkJzDDV2l40JuZWbK5VFDm+m+lUjWKlE0AEHw96
 KkOO4dtYO4m2wsdYtoDIxQIg5oXwcAtbTsE9lLgZ9kDi1CpXQ3YyzBahYZ/Mg0ZZIqI+6P6+m
 Jdgj+z4PsdOjKPXwUcxKLZwJm9b7azaMDJTOtMLKzmB76C/54gn2/cHFjDC8d2wUgSIbsohVw
 fS3XWatI73eewqk8sbiTLEalH9OTCez6idSTiuuM8tFoM+GNo6RFXuWBSF2BmCJynf2OCnRg7
 0aSZw3zTxT8+lha6tAr+41rXcahIZfYMj0fWVk8AXEX5fmTlPBh4c/YcsrF54f3R5Wbiq+q5a
 1Wx2nk2VtGTHzqLX2Q41aZnmjyhpHna+F5Rc7X8TDKfGHjJySgCyqPVnnDgBzsjg92M9RHWdi
 o0s8lFC+oBvlI9KQbXzYfpxNirgexzglbZhbRJVWSehwdwTnWscGNmouzR7KxYTYPQ+Y8dLGI
 Utia/0ZddfDMOUSugfQ+t79ZCLAkYpyIqPgD0rJggoOenc/VDaYGcgYLa+ovL8OpvEJxkmI/L
 +1kBZfMM257YTqaPiuRBR0CncJwV8EhQPH4DY6a6IYW37qhIAS65xJCIb8GF3xCPbXQe7jrTx
 Mo537Ds3+lcVrvDRw4SEqVC/DfRdWBKapaWyxMItrc5kw=

Signed-off-by: Patrick H=C3=B6hn <hoehnp@gmx.de>
=2D--
 drivers/i2c/busses/i2c-i801.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2c36b36d7d51..c1fee2c61da1 100644
=2D-- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1231,6 +1231,7 @@ static const struct {
 	 */
 	{ "Latitude 5480",      0x29 },
 	{ "Precision 3540",     0x29 },
+	{ "Precision M6800",    0x29 },
 	{ "Vostro V131",        0x1d },
 	{ "Vostro 5568",        0x29 },
 	{ "XPS 15 7590",        0x29 },
=2D-
2.43.0


