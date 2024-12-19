Return-Path: <linux-i2c+bounces-8628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8E9F780E
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 10:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96D71896405
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 09:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13340222D4A;
	Thu, 19 Dec 2024 09:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VC0ONggL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9D122147D;
	Thu, 19 Dec 2024 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599360; cv=none; b=Nfl/LJ1D16TaT19XUI/5bezT9RYvrY/7QPSQv8790cfRsCYWRIiTXFpyCt3T3HAcxd/HeVYQs+jktn9c/Qss9zQwSbXF2yovajgxaLuz7MC4LoDcYeLPbeb/x/VJvQhFNzd8il1XE2NsUCQ0p44u1sfuJSIvOAjImnWkQnrT/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599360; c=relaxed/simple;
	bh=zCTHUokrIv5wtZdtVEeGYNWrFA+kwuabQ6ehlYaapbg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VTAjiLo1SYNH0ZjUuM6nPmOwCAI+q0VaOkVILtaOdT87ev658wSsj/IvdYUFni1NKjsJ76X8kg57d3P1yhbJDOpqWeCpgQXAEP/w6XNDWykwvZHWopppohliMVSJGTMXJC+bmbHnjkTvvV2VqXYXhHbW6Elky7oisQSBzlEQJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VC0ONggL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2165cb60719so5183865ad.0;
        Thu, 19 Dec 2024 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599358; x=1735204158; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jzZT6TwhtRV8As1g0Br4z6oNEAAXSFB3IR9CjR0VtHs=;
        b=VC0ONggLXh0k8EtLZJQKQvy55UGT5QhMBw48ChaHt7bA+AhQPgGsaMOQlZYyA5JZ0x
         UTYM9vnChussgfg99Au3Jx2VGKOQICSemJrrNVMNdX2TOYLwZhhxRR946Wmz5UEBrrv/
         wibUGFw6Q4ycqUaP9fGc4vg9q3eujl/fHBirnpv6/LFDG5sNKUxfQet8Vc3ngq1fqRNB
         9LIbUe0wTw/ImbFlf1p3nTfNYXm3z6ZSOdmPXpgy82o/6QTir7/VHsxjWOAhjKm8LFG1
         tB6gN8KAKc0i4uEkyqlNaks3s17Lz909liyxg8YDjw0y2M27ziEByukiq3XuoEkkmmAQ
         L9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599358; x=1735204158;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzZT6TwhtRV8As1g0Br4z6oNEAAXSFB3IR9CjR0VtHs=;
        b=NzhyjmqfDxCIi8uCcP0bkUaOHLDpUfq1+qvCPfN+Kbu92OSbHFcstAI8YBbTXoDWeo
         M68qZltxa08axprZH78qnwtE6ilEWv2jNlEl+61+TXCefoD7gp31ijFqKlAWcywJBzr7
         7liUlpJn+vROTiSOx8FOlwJ52D/sy6lJXScbnTRHtevePg9fB4MGPSkRhVUqSOaadFIw
         36klH3XcQ3z8y4AJF36udfZtjgnAVh0tOoACBrrno5S//O84tIuw9OpFPztA73ybSo8I
         CYhQygzHnWLzyb3pOwGameNQMthgp5JuR3fE6R+/3Ry5Usv1aeTrsOuW7gSK7+Gh9Lbx
         SYjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Qe+qvrEodR2Fnzh9rQP+l/I7iF5Ss5qt8Ul266J6fyDglaawVcXvrseqodzORKZH3S9IynRQjHc=@vger.kernel.org, AJvYcCVl1nsDhqu/RnRwLNdDSsSfjFK0copFxW8p4+F0AveM6QQPLFmwVU3BdQVkuQGcEUZHUNXYY8eo+dGmalay@vger.kernel.org
X-Gm-Message-State: AOJu0YwRz2+7s7g7rJiWI89xFytaTuDnoBQxkL84WGlspy0nWVj6gItL
	aDYfWuMue4XasyFbG9Taf2nf1VEtmcpiM5VMevPZH4t8a6n2KUk=
X-Gm-Gg: ASbGnct8W/KpAxNm2ROjNW8rKfrxOgy/c2pNNKkvjkhBaBFen1aTVHZoAwChA36S9j2
	IsOGLz3j3RgjWxSU6/K4wA+7e+0Ei0vWhBlDU36vNUqzqTymgq9mrXKq1T6f28gwyxR516egNHF
	N0H33FMpcsx1jMQjydeeIYNK5d2HlL3EttFBZpPwxyayehV9KIjYJ2HtRG0+kfC1JyYRDnni1b0
	IDekCua1Z/4O9OLEurRio5aZddDhLxTHNdeXXRJJ8oGDpz8Efe/gq5GFbcxNibbF9ccsqWpw0eX
	PlX784gBhckiufLgJdEYeiZFFJv8S67kmxHJL7R1wPEM2zD5
X-Google-Smtp-Source: AGHT+IErJZuvW91Ox1GbnItc2RtMNO/lrRVXIpHpCWNjIRs59rsAH/atATMYg7HsgdgvdzF4Cm1AQA==
X-Received: by 2002:a17:902:fc4d:b0:216:2dc5:233c with SMTP id d9443c01a7336-219d9692f2dmr44680875ad.41.1734599358516;
        Thu, 19 Dec 2024 01:09:18 -0800 (PST)
Received: from localhost (2001-b400-e356-b45b-f574-35d0-91d3-527b.emome-ip6.hinet.net. [2001:b400:e356:b45b:f574:35d0:91d3:527b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962db4sm8151225ad.7.2024.12.19.01.09.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 01:09:18 -0800 (PST)
From: Tyrone Ting <warp5tw@gmail.com>
X-Google-Original-From: Tyrone Ting <kfting@nuvoton.com>
To: avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	andi.shyti@kernel.org,
	andriy.shevchenko@linux.intel.com,
	wsa@kernel.org,
	rand.sec96@gmail.com,
	wsa+renesas@sang-engineering.com,
	warp5tw@gmail.com,
	tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com,
	JJLIU0@nuvoton.com,
	kfting@nuvoton.com
Cc: openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Boyer <Charles.Boyer@fii-usa.com>,
	Vivekanand Veeracholan <vveerach@google.com>
Subject: [PATCH v8 4/4] i2c: npcm: Enable slave in eob interrupt
Date: Thu, 19 Dec 2024 17:08:59 +0800
Message-Id: <20241219090859.18722-5-kfting@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219090859.18722-1-kfting@nuvoton.com>
References: <20241219090859.18722-1-kfting@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>

From: Charles Boyer <Charles.Boyer@fii-usa.com>

Nuvoton slave enable was in user space API call master_xfer, so it is
subject to delays from the OS scheduler. If the BMC is not enabled for
slave mode in time for master to send response, then it will NAK the
address match. Then the PLDM request timeout occurs.

If the slave enable is moved to the EOB interrupt service routine, then
the BMC can be ready in slave mode by the time it needs to receive a
response.

Signed-off-by: Charles Boyer <Charles.Boyer@fii-usa.com>
Signed-off-by: Vivekanand Veeracholan <vveerach@google.com>
Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Tali Perry <tali.perry1@gmail.com>
---
 drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index 1aae1a8a8055..3ca08b8ef8af 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1925,6 +1925,12 @@ static int npcm_i2c_int_master_handler(struct npcm_i2c *bus)
 	    (FIELD_GET(NPCM_I2CCST3_EO_BUSY,
 		       ioread8(bus->reg + NPCM_I2CCST3)))) {
 		npcm_i2c_irq_handle_eob(bus);
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+		/* reenable slave if it was enabled */
+		if (bus->slave)
+			iowrite8(bus->slave->addr | NPCM_I2CADDR_SAEN,
+				 bus->reg + NPCM_I2CADDR1);
+#endif
 		return 0;
 	}
 
-- 
2.34.1


