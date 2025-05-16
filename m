Return-Path: <linux-i2c+bounces-10999-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F37AB99AC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 12:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECA30189E495
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 10:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C69B23183F;
	Fri, 16 May 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1M1bucr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B4A381C4;
	Fri, 16 May 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389919; cv=none; b=cG8435gScA0j1kr8a8wg5A+uWIfTXjmucvCYi3VDQtIpfNiA5aTl0PPI9pafENIvDNx1/dJpvPL4tjze4I4YX5GFbLLgeel0ThTOPp09xlbjUANzNzCMprFmsU1sX3W0EC3WXQUrfsssNgn121sj7rTCnPfHTtlBRp+Kay4wHNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389919; c=relaxed/simple;
	bh=/1cSL/Lh7tlBOp4/gUuenclvwCFSIFtB1YjDaNqi7c8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHH/l/7WDmBakZ2UFgHaEMSz15Zp2tGEvBSGP4inNSDbc+b/OAYdiregopzAvHwvXqd43T9o59Uh6sRDrE3ze4Eyotl5GSrFSsAs8sU+HBug1wVrzQX2kK1dL0sXpd8lE2+SYmBOoCUp0Lrk4mOCZCglAxosOLXBe/ePzHe1/TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1M1bucr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-231e98e46c0so1683365ad.3;
        Fri, 16 May 2025 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747389918; x=1747994718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFijRLgGDoaMi5lWPDlmsyQ4o4dXkE7VloEdKbWCl3Q=;
        b=U1M1bucrfDgWLTP448EbmAWu3FUyTSMoyeoohuxmES5xqyPpqV6zNovE5v6nTDL/ad
         DhwjZGjyq487UJGiYF+3GCZyPhIYijuqL2+PPPlRfDfzPoIq29XTFHznbFaeOG2+hWvV
         6zMBTm+1yVIdR6nSSbqkyyFiGc2/0BDMZB2FIYePI8C8QB4u9XAAbqtv/rCL8AQUedyB
         t5sTO9wYD9vbn+Tr+mUNdOS6o8E/FmGtvwCSRcaQsuFzBIZ/twZdoysCk5HWD3Ahj8aw
         LIZb2vjosZgdK/PEh4QSHJ+WR2pv0P/LkB3rrL1lL0YLYpPO7ApvTxQziDubZlBhHNN4
         jnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747389918; x=1747994718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFijRLgGDoaMi5lWPDlmsyQ4o4dXkE7VloEdKbWCl3Q=;
        b=Rn00ayWiPbr8a1nPbBl07i0lL5pJEI8jvA8YzNKHYHNgdaN99zcy6gfUYcA2CzGCjf
         m34iPojytHbpxm/IWils+5L2OKuOis23zKpZjBp91Zdd0gL+QaRgXVQ7ZuI2drG+THp8
         Bl0HnGP8LH8FcQZ6J/n6wsov6bJO+RdQ6oUieUVKVTulQZ/IcZXRE7o8es+gbG2YrGSy
         Ftnde4ECfpYBYjNZFtnhBXFruSnKyT61lpFXJRC0p/HLmAgRIGD8BDDEx43eae2MNEal
         C8iq6ZPbTn57hxeWl0pCO35A1dtb72i1S46+/iC5VMIcmBvR2ZktZ4rdVBmkI16gPc49
         vzQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVV2tQ4Y6kEBZPNFSHrgC6qwrL+iH02nxbFeU+k0P+RWH8l3cD5n4qTZjlHYD3Ev322336uU9QEozecZfk@vger.kernel.org, AJvYcCXpo+lUbvYOTTMyHky3nKUC8OYr5Eh0o0W06lG9FLQCCavhfyDt9tP2GCc7R5UTO2PBLixokCx0xVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl6WRMEhVhL7evoD7GBgx3bI80SdJeLkh0sOu/fRxhI0t8fHUs
	HEMoZSpqagMtO8xRoS0PledzaxjBPuvkj8+A5ff74UT21XYj6aO1Yhuct5fo1xBw
X-Gm-Gg: ASbGncv3NcfnKl7jh1ExptQfUw3pG0YZRvtHZRRWt4tiQISa1FZi2KtKs0xA1TqABfe
	nJyEOQcLgeQpOriedfApRSzv6vdGqmnuK6IAtc2u/K7MCLkita2Fb/od+wViR2Z7p12EtTroMou
	cHUIQtayrLPwZClt2XFPgeGp8sf97C8hrubCJza7p3oznc412jcfskgsRLid69uSewaTNx8AsO7
	v3RYC/hwfmClbe8HDeJ+FxEuTHk0Tr/HGdPAE3fvUOkvHIBseSihImARxlYQgkyQo2dMLIIjzml
	NkhsxdbooL/paRdu4qekSpPuvyHNIFTEZVU4+Qz/mJY1EgAG4D0/tKYM1CeP0oQ=
X-Google-Smtp-Source: AGHT+IFnBvl/fc5vkXH6aoPRzVyKb0aBPkGRkmKPOR1gB40ebLaewudBvyA06ohiC/L+TZL2gX7XJg==
X-Received: by 2002:a17:903:24e:b0:22e:4a6c:fef2 with SMTP id d9443c01a7336-231d45ae355mr38262335ad.53.1747389917675;
        Fri, 16 May 2025 03:05:17 -0700 (PDT)
Received: from harshPC.. ([2405:201:400a:31fb:f6e6:d112:b6:cd3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9828esm10988575ad.114.2025.05.16.03.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:05:17 -0700 (PDT)
From: Harshal <embedkari167@gmail.com>
To: jdelvare@suse.com,
	wsa+renesas@sang-engineering.com,
	skhan@linuxfoundation.org
Cc: Harshal <embedkari167@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: i2c: fix spelling mistake
Date: Fri, 16 May 2025 15:34:38 +0530
Message-ID: <20250516100445.8484-1-embedkari167@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix resistors spelling in i2c-parport.rst

Signed-off-by: Harshal <embedkari167@gmail.com>
---
 Documentation/i2c/busses/i2c-parport.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/busses/i2c-parport.rst b/Documentation/i2c/busses/i2c-parport.rst
index a9b4e8133700..4cbf45952d52 100644
--- a/Documentation/i2c/busses/i2c-parport.rst
+++ b/Documentation/i2c/busses/i2c-parport.rst
@@ -84,7 +84,7 @@ Remarks:
                    \|
 
    must be 74HC05, they must be open collector output.
- - All resitors are 10k.
+ - All resistors are 10k.
  - Pins 18-25 of the parallel port connected to GND.
  - Pins 4-9 (D2-D7) could be used as VDD is the driver drives them high.
    The ADM1032 evaluation board uses D4-D7. Beware that the amount of
-- 
2.43.0


