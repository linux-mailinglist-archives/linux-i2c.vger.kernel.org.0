Return-Path: <linux-i2c+bounces-13225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2DBA58DF
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 06:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C4F67AE39A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 04:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5B3222568;
	Sat, 27 Sep 2025 04:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxH+Ebd/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF018FDAF
	for <linux-i2c@vger.kernel.org>; Sat, 27 Sep 2025 04:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758946533; cv=none; b=GIqA34vxG7k28Ta5woE4uL5SL43hJLc5j/YG00BQHmufUbzRqKy8nneIbjI1GKpeO3TVjowsBP+o52izgPm+I5BPf4s0gTNH3vUeCHhVYWujQbSoFb4T3pHQy977qt0vgzwebO/ltE+DmbFSdNx4+h6e/eW5EygkyuehEvbQl80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758946533; c=relaxed/simple;
	bh=1S7qkacQtOJLn4B5dSDEdf4PQhZDBi/JrvSfER614yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrD4zd6EPxRj3vwePSpPhnFmLT4X9SzUIwacIShCw2Pln+TK2VCzTfmzBz1ZV+mgivqtrHLOYW/DFBOW9Ml0ixq/5YW/PqL/H7hddAlvvjFx3zT6UGliwON5YW9itSJUkdXw24F423r7QbReIxHtz6XVWn3VawsOkI4K6oyvUP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxH+Ebd/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e23a6617dso28759605e9.0
        for <linux-i2c@vger.kernel.org>; Fri, 26 Sep 2025 21:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758946530; x=1759551330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ5MmPkHxZioIeQfPFm5x4+gWD/pC2wMeHLaiRdBbYA=;
        b=TxH+Ebd/wfXSrcLxUmPbl+DDKzRyM+RLb7nNFfyfwo/vKj9UAThW/A9cK3eFa3fYOa
         QOKIDwbFlJDk/eaWHe/St26GBFfym6skNoznrbSGr/QG6L9NFIJqbxTHTwrWbNo9HZ1N
         HGbootu6KcU5YrumDKwMQbGolILgHvkcubwgyo4Rn4Ii9mswUpfbuVnBB4qJ0fhx6ETU
         DhFSUwmMT/rad8J0OKW4MsLGJGb1YqeaU3oBXzC2emxyHBhBs3rPmFcmk0ZVdNpP1f8r
         tFPKr/2oUr1NahuGQ4Pwg0aA1vUQq+NSx0vR8mYMmxv8BOw47DSt7tv7RdZmf8XjzYmZ
         A5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758946530; x=1759551330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ5MmPkHxZioIeQfPFm5x4+gWD/pC2wMeHLaiRdBbYA=;
        b=ffawxWjU/bIcjdY40qFiAnleKSS9ksEqF+sSwb4Yk8u2XdEpDaFdcXOhYetZyRQqDc
         YN6ZPaHfYxN6vCr65QrfuSP02FMi1QZpIUTHcnl02BFNZe/45tgixVtUhoklSPmUyE0b
         TGHMjnOy89fc1kr0mOq88+6Ct1riooyHtp/atMbaVBIvVKmHH7hP2DdT4ZzJz0VaoRM+
         ik/QicL2Gzrqk27PxpZEcsWAZo21DdK266tQiBjoQDP5aCReT531xz4/bUXp9mbQUPq9
         Ir9nc687seePIvvD5iLOLFDLKColP9vq8pC+fWaWieGgYU3E0U2DCcUjDBhgvy2fcToA
         /+dQ==
X-Gm-Message-State: AOJu0Yx7OfRk3rJFwrNxmqKXyEjz5Shlw5kYawEN8PkH6+taMPNgwG6E
	3t5d4yH/K8Wa1C/YrvHO+FO8Emm/iG6Lfy4EwgADrcyPIj+dDqmXl8Ch
X-Gm-Gg: ASbGncsqndu6Wb7k0c3741ecZEZsbzLDrDAXoFAvVvFgLUp8pAEpc0b739BGGLZwmQ3
	otwI1FuoZ8ct+QAqt6iFFsZVccSMKYnGSUoP68dPrf8nnqFmVcxGiMZK0r95wEqOhhKkx3mCFFU
	NIsSrHokgd6D6eShDt0oX8KT3CT6RhT7h6NlnY4URTvTKhF7Qw1rV1NfNOVACMuune9nqXdti0q
	50CYCs9YQrODlwlxa6EovEp8bjrhEJG3X9vOOjBZ4CnCkOTZ+RI5IRxIkENz/xhLD9fScPiAKLW
	co2E+rKaGQneOIlDO0DoYX8psgyF2F94IadKz9LxCxsNGSjCqrtBCtU2xR+eHxaLD+KaNSAH6Mm
	Xd1/7Hhh5qP6NyhTkoDEGUdRnFVkdNZKK+eqfaoRZ
X-Google-Smtp-Source: AGHT+IHNltIrUty9L1vjsZ4/Hwqq3Wgf3VB8CTDHf03NWXIxmr7SHAgznCOWO2DvuwbAOd1ynDRO+w==
X-Received: by 2002:a05:600c:4e8b:b0:46e:38cc:d3e2 with SMTP id 5b1f17b1804b1-46e38ccd4dbmr47800515e9.22.1758946530076;
        Fri, 26 Sep 2025 21:15:30 -0700 (PDT)
Received: from hangmanPC.. ([86.124.200.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33105e0bsm50386665e9.5.2025.09.26.21.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 21:15:29 -0700 (PDT)
From: Cezar Chiru <chiru.cezar.89@gmail.com>
To: wsa+renesas@sang-engineering.com,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cezar Chiru <chiru.cezar.89@gmail.com>
Subject: [PATCH v6 3/3] i2c: pcf8584: Fix space(s) required before or after different operators
Date: Sat, 27 Sep 2025 07:14:00 +0300
Message-ID: <20250927041400.172949-4-chiru.cezar.89@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250927041400.172949-1-chiru.cezar.89@gmail.com>
References: <aNbWejNZLYGuNvCI@ninjato>
 <20250927041400.172949-1-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Require spaces around '=', '>' and '<'. Add space(s) around binary
operators.
Enforce errors fixing based on checkpatch.pl output on file.

Signed-off-by: Cezar Chiru <chiru.cezar.89@gmail.com>
---
 drivers/i2c/algos/i2c-algo-pcf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-pcf.c b/drivers/i2c/algos/i2c-algo-pcf.c
index 41a81d37e880..d675d484fe66 100644
--- a/drivers/i2c/algos/i2c-algo-pcf.c
+++ b/drivers/i2c/algos/i2c-algo-pcf.c
@@ -183,7 +183,7 @@ static int pcf_sendbytes(struct i2c_adapter *i2c_adap, const char *buf,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	int wrcount, status, timeout;
 
-	for (wrcount=0; wrcount<count; ++wrcount) {
+	for (wrcount = 0; wrcount < count; ++wrcount) {
 		i2c_outb(adap, buf[wrcount]);
 		timeout = wait_for_pin(adap, &status);
 		if (timeout) {
@@ -272,7 +272,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 	struct i2c_algo_pcf_data *adap = i2c_adap->algo_data;
 	struct i2c_msg *pmsg;
 	int i;
-	int ret=0, timeout, status;
+	int ret = 0, timeout, status;
 
 	if (adap->xfer_begin)
 		adap->xfer_begin(adap->data);
@@ -284,7 +284,7 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
 		goto out;
 	}
 
-	for (i = 0;ret >= 0 && i < num; i++) {
+	for (i = 0; ret >= 0 && i < num; i++) {
 		pmsg = &msgs[i];
 
 		ret = pcf_doAddress(adap, pmsg);
-- 
2.43.0


