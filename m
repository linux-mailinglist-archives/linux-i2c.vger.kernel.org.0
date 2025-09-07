Return-Path: <linux-i2c+bounces-12717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD20B47C1E
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 17:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06F3F3C216E
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 15:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEED427AC44;
	Sun,  7 Sep 2025 15:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQ4AwXih"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B4220F29;
	Sun,  7 Sep 2025 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757259532; cv=none; b=CbsAbnH4eDoM6YYbv8oq0/m8cZjTnMAnqLUIgJK/ra5ZBwZkeCxD2X1f3HP1j6Dywj0i1v7QtFybw2elR6N+HqW9o0XgvNoFc4KGIky5le0Mz9i70HNd11CF4BRUK7DT0hOeKF650T/tl+Zi0ALNqOTnwmkpQtFn/2Z6tcbacCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757259532; c=relaxed/simple;
	bh=lDO4ZnGvvxmNagc+40WRTZnZYMHMlF+Xr8euU/H9pFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVGDHl72FSv27vV/Rjt9DgQhsF57/X6qLsdd7d4AIybB33UPXFpA1ZhaoVc6Nyl2lVVyrUbOJpsDiJDq/u+6NcfNbrjSjeig0ndz1mT1SHzfSFQyzha5o6J/cxnIOiPS2UxRqJayIPA4yGnJ9DixegNc+i7Ba79QqYQ6hwh/RQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQ4AwXih; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so565461966b.3;
        Sun, 07 Sep 2025 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757259529; x=1757864329; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ewo3lFX4AemOdbQPj/j4B6dTMNh77WYmoVI0MYm1/KU=;
        b=cQ4AwXihBojcPeFGtxsNCOnAryGpUK9OnfMRSL1NKUbITtL2P+sdiZZt+xtPFlVpho
         Zz49yg4Gqzy4DqwN5xMZXpBIXbKgSnwCHo+VpRWHNqzRG1VVtEraXaMGUJZjOhdc+UZC
         qs7WOSv7x1C9SU3A3QK8iV/AKWLbq/MvtqkcWzgbSYmpGgk9nEngh2s1wrqWJkla1+p7
         LdFrGhjainenos9W8aHchY07jteUgsHL1FCyLn+2+o3pI8u5WQOZpZTDJFWImI2EyGBv
         R9+tg5laTjwxDvUxBdkqX/50ULjJwpUfMGzHPmKDJUlrS9Z8oq21dmA5GFuxCQd1yb1X
         QYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757259529; x=1757864329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewo3lFX4AemOdbQPj/j4B6dTMNh77WYmoVI0MYm1/KU=;
        b=dAfYqL6s07688w+kyB+8NxPv6jab6NJJInFqUcxWR9ZCqtIJReAvMLzl9hpDReGTtl
         /SWlGtIdMKR5y+/r1AvTF4Iun7A2SkeSElU3Csk7gXlaserEmklA5bBKu5KihuniJuhz
         wwzOlvYZgNltaqq49W+FJlb+HISD8EZKA69jdseOIkA7BaBNf53L3XDyPKpUvAIuiV2C
         WJo3qBdadA4cY25KCPCiWlIZctpfjWiKOn3Gv+QaTwb2Trw3ljGpLNlY9PN2Aws9on8b
         FQWP2/bfGmfymfDitA7g2IdyY1z4hivVSH+TczkK37XvlXK/g4tpdBvXeF6ZobpWVLSv
         CY0A==
X-Forwarded-Encrypted: i=1; AJvYcCUP0Z/JW/itDMf907cssRaQpMO516POpsHY3FOWTOaKA/zuttvHFGEAdhxlZWECP5SBqjzn281uG2cGPLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YznQKN8Qfkl4eBNDQYTZSDfsRo+k/LttPawUX4TSg1pdfrJ2liZ
	zA0dbEeZ/dc2uv+EdEiiWHvuCEshZRnTu4FthB2rtTs2rtV2Yiw2nzkR
X-Gm-Gg: ASbGncsMLjWqndeVt+XTWjlDYmrORQmfQ71XBpSkdqlw57R/utldtW2OccNiFQJcEvB
	z1iqmsCmeAA5lJuEfdpJBCqRMramI6Ds6Eh2j308kHW2M8dUHV5GDMW2tZeQroCkFueeUG6rM3u
	rZMLQQw5PPE16xUKOqXHwlMbRDFx0egavlh0yQw+D0etSuWRUTF8A5YBkOL14eLuTcFp30pcb+k
	juYAJi6TVKPtMhZwKQAXDKYNR6wpA58cCboURakmASJaTrfRNB3Lolf/iQEUQOlMxUVjrrGbqm5
	vfDE3DoadxhkcTidm3qX00koKOSUOr8LdhO+RYX5lnYHbdXDN33tBR0gFqDqjSxa9w7J15daDGt
	Q7gJP0VFz/BZAsXRPJ8AjQxHY94Q=
X-Google-Smtp-Source: AGHT+IEO34mARCatC/ctUqV8ApOE2K5yTlrg3z3v5scJEnfSEe60fotV7PrsEABK/LbCtv786mQ3LQ==
X-Received: by 2002:a17:907:3e0a:b0:b04:3402:3940 with SMTP id a640c23a62f3a-b04b14afdc4mr550079566b.27.1757259528948;
        Sun, 07 Sep 2025 08:38:48 -0700 (PDT)
Received: from hangmanPC ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b044703f412sm1446984966b.56.2025.09.07.08.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 08:38:48 -0700 (PDT)
Date: Sun, 7 Sep 2025 18:38:44 +0300
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: Markus.Elfring@web.de, andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	chiru.cezar.89@gmail.com
Subject: Re: [PATCH v2] i2c : algos : i2c-algo-pcf.c : fixed errors shown by
 checkpatch
Message-ID: <aL2nBBmyQ-gks8Q3@hangmanPC>
References: <20250907120706.44114-1-chiru.cezar.89@gmail.com>
 <dcadf502-8c14-46fe-8e2f-222cdec4dae4@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MTYAFGRcgjVOzjI/"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcadf502-8c14-46fe-8e2f-222cdec4dae4@web.de>


--MTYAFGRcgjVOzjI/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Sep 07, 2025 at 03:19:20PM +0200, Markus Elfring wrote:

Hello Markus,

> > Fixed all 18 errors revealed using checkpatch.pl on i2c-algo-pcf.c
> …
> 
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n81

Refactored the commit message to be more compact

> …
> > Motivation is to fix all errors and warnings i2c-algo-pcf kerenel
> …
>                                                             kernel?

Yes, "kernel" was intended. Fixed.

> > v2:
> >     Fixed build errors generated by missing ; after do - while.
> >     Missed to git add latest changes to patch. Build is ok.
> > 
> > Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
> > ---
> >  drivers/i2c/algos/i2c-algo-pcf.c | 42 +++++++++++++++++++-------------
> …

I moved the version info and information from commit message that didn't
needed to reach the commit message after the --- marker line of the patch.
 
> 
> * Please move your patch version descriptions behind the marker line.
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc4#n784
> 
> * Will enumerations become more helpful?

If you were talking about enumerating the type of errors fixed in the commit 
message then I done that. If something else, could you please explain it to me?

Markus, Andi, new [PATCH v3] attached to this email.

Thank you,
Best regards,
Cezar Chiru


--MTYAFGRcgjVOzjI/
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-i2c-algos-i2c-algo-pcf.c-fixed-errors-shown-by-check.patch"

From a94b19cb2c689989dbe72c04864bd718f2c05307 Mon Sep 17 00:00:00 2001
From: Cezar Chiru <chiru.cezar.89@gmail.com>
Date: Sun, 7 Sep 2025 13:41:05 +0300
Subject: [PATCH v3] i2c : algos : i2c-algo-pcf.c : fixed errors shown by
 checkpatch

Fixed errors revealed by checkpatch.pl on i2c-algo-pcf.c file.
Errors fixed were:
    1)macros starting with 'if' should be enclosed by do - while
    loop to avoid possible if/else logic defects
    2)do not use assignment in if condition
    3)spaces required around '=', ';', '<' and before ','.
Motivation is to fix all errors and warnings in i2c-algo-pcf
kernel module.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
Testing:
  * built kernel with my changes and I2C_ALGOPCF=m enabled
  and it built successfully.
  * installed kernel and external modules generated by build
  * rebooted and loaded using modprobe i2c-algo-pcf kernel
  module with param i2c_debug=3 and no message was found
  related to module in dmesg. But also no error was generated.

Checkpatch.pl warnings  on patch: on running checkpatch.pl on this
  patch 7 warnings were raised. Will be fixed on following warnings
  fixes patch.

V1->V2:
  Fixed build errors generated by missing ; after do - while.
  Missed to git add latest changes to patch. Build is ok.
V2->V3:
  Fixed commit message spelling as pointed by Markus Elfring and
  by moving non-essential parts of commit message under the marker
  line.

 drivers/i2c/algos/i2c-algo-pcf.c | 42 +++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index fd563e845d4b..f5174f38d777 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -23,9 +23,10 @@
 #include "i2c-algo-pcf.h"
 
 
-#define DEB2(x) if (i2c_debug >= 2) x
-#define DEB3(x) if (i2c_debug >= 3) x /* print several statistical values */
-#define DEBPROTO(x) if (i2c_debug >= 9) x;
+#define DEB2(x) do { if (i2c_debug >= 2) x; } while (0);
+#define DEB3(x) do { if (i2c_debug >= 3) x; } while (0);
+	/* print several statistical values */
+#define DEBPROTO(x) do { if (i2c_debug >= 9) x; } while (0);
 	/* debug the protocol by showing transferred bits */
 #define DEF_TIMEOUT 16
 
@@ -160,7 +161,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	 * check to see S1 now used as R/W ctrl -
 	 * PCF8584 does that when ESO is zero
 	 */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != (0)) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != (0)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S0 (0x%02x).\n", temp));
 		return -ENXIO; /* definitely not PCF8584 */
 	}
@@ -168,7 +170,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load own address in S0, effective address is (own << 1) */
 	i2c_outb(adap, get_own(adap));
 	/* check it's really written */
-	if ((temp = i2c_inb(adap)) != get_own(adap)) {
+	temp = i2c_inb(adap);
+	if (temp  != get_own(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S0 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -176,7 +179,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* S1=0xA0, next byte in S2 */
 	set_pcf(adap, 1, I2C_PCF_PIN | I2C_PCF_ES1);
 	/* check to see S2 now selected */
-	if (((temp = get_pcf(adap, 1)) & 0x7f) != I2C_PCF_ES1) {
+	temp = get_pcf(adap, 1);
+	if ((temp & 0x7f) != I2C_PCF_ES1) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -184,7 +188,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	/* load clock register S2 */
 	i2c_outb(adap, get_clock(adap));
 	/* check it's really written, the only 5 lowest bits does matter */
-	if (((temp = i2c_inb(adap)) & 0x1f) != get_clock(adap)) {
+	temp = i2c_inb(adap);
+	if ((temp & 0x1f) != get_clock(adap)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't set S2 (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -193,7 +198,8 @@ static int pcf_init_8584 (struct i2c_algo_pcf_data *adap)
 	set_pcf(adap, 1, I2C_PCF_IDLE);
 
 	/* check to see PCF is really idled and we can access status register */
-	if ((temp = get_pcf(adap, 1)) != (I2C_PCF_PIN | I2C_PCF_BB)) {
+	temp = get_pcf(adap, 1);
+	if (temp != (I2C_PCF_PIN | I2C_PCF_BB)) {
 		DEB2(printk(KERN_ERR "i2c-algo-pcf.o: PCF detection failed -- can't select S1` (0x%02x).\n", temp));
 		return -ENXIO;
 	}
@@ -209,7 +215,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		DEB2(dev_dbg(&i2c_adap->dev, "i2c_write: writing %2.2X\n",
 				buf[wrcount] & 0xff));
 		i2c_outb(adap, buf[wrcount]);
@@ -246,7 +252,8 @@ static int pcf_readbytes(struct i2c_adapter *i2c_adap, char *buf,
 	/* increment number of bytes to read by one -- read dummy byte */
 	for (i = 0; i <= count; i++) {
 
-		if ((wfp = wait_for_pin(adap, &status))) {
+		wfp = wait_for_pin(adap, &status);
+		if (wfp) {
 			if (wfp == -EINTR)
 				return -EINTR; /* arbitration lost */
 
@@ -299,7 +306,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -313,7 +320,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: Doing %s %d bytes to 0x%02x - %d of %d messages\n",
@@ -358,9 +365,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only read %d bytes.\n",ret));
+					    "only read %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: read %d bytes.\n", ret));
 			}
 		} else {
 			ret = pcf_sendbytes(i2c_adap, pmsg->buf, pmsg->len,
@@ -368,9 +375,9 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 
 			if (ret != pmsg->len) {
 				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: fail: "
-					    "only wrote %d bytes.\n",ret));
+					    "only wrote %d bytes.\n", ret));
 			} else {
-				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n",ret));
+				DEB2(printk(KERN_DEBUG "i2c-algo-pcf.o: wrote %d bytes.\n", ret));
 			}
 		}
 	}
@@ -406,7 +413,8 @@ int i2c_pcf_add_bus(struct i2c_adapter *adap)
 	/* register new adapter to i2c module... */
 	adap->algo = &pcf_algo;
 
-	if ((rval = pcf_init_8584(pcf_adap)))
+	rval = pcf_init_8584(pcf_adap);
+	if (rval)
 		return rval;
 
 	rval = i2c_add_adapter(adap);
-- 
2.43.0


--MTYAFGRcgjVOzjI/--

