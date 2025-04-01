Return-Path: <linux-i2c+bounces-10081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB75A780D8
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 18:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C5FE1887D53
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 16:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E35204C19;
	Tue,  1 Apr 2025 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVf5oyOz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15550C2C6
	for <linux-i2c@vger.kernel.org>; Tue,  1 Apr 2025 16:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526188; cv=none; b=s+iPf3ZIwq3iR+qiEW+YwmboEX9JV9BJk9utbAWkdAUArtaUh9KEpSZmgwqfgMVm2RbWiBkL1A9xZV09xNc38y0znX1QU/0KOxPLXZQ0kvmhVh1PAcDMOWoOuWwZIDuKw7EI+RJvlc9dLa0OJQmYqQc5ofnhoeiB7hMQqDr4Ztk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526188; c=relaxed/simple;
	bh=rZCDRG4CFspESBVD/lcVp61KIm35/WZkI7lHcvZAXN8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=D5OKNREo64TJMuRl7j1hGE6x3kyOJw9dJcgLA4Uuwb1bObJrFzI+pjGvpsePj8/bwc4xiUvDLAqe1frkNSjoVxz/ZR0gGbakadF6OVLP8adYzp4MBUGnAvrM0c1zACiCWZ7o0v9RGfjr9g2UJY7qNV+1VqmjI4Pyq2tr6SAxwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVf5oyOz; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30c2d427194so58230151fa.0
        for <linux-i2c@vger.kernel.org>; Tue, 01 Apr 2025 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526185; x=1744130985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NG+6qS6ALllZMtlf4irdyBoh+D/iBBdG1oml18vG690=;
        b=DVf5oyOzyqjWcIm0dWOq8/0SLL8Bw30tQp+auzkysRcZ/IPRQPgY0xVj9Mn4ZUvmPI
         LirxzNYC4VOrOM39khwH8TKL7wVNGqqSUPyHwIjAAogdCVik8yPPzZMGFgtdqVR9hilG
         kvUDQh64yjHOqILrBl/NmwMIDm+LOA4Tx4z5VKx7MNqWiBR+GPdcBAMbJQl1RXaNqBWe
         823KgnXHnU4K+MZ5wLozpiyhG+y29ZQZ1hDs+LrTkAZtY8WyrqKLtX8Hi3wtJGEgtUpI
         eubBdjSDIeI1ocovA1grZqpMJVR+km36k3plDyjueDR/mQ/RdRCREc350387/JAARm+J
         7olw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526185; x=1744130985;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NG+6qS6ALllZMtlf4irdyBoh+D/iBBdG1oml18vG690=;
        b=e4uk6cW2o3AJC4IAgsID0nFSfwZtERgkowB/9b0Zcz7arjk2r/eUfH1N6n9mLH5iWi
         8T4E3jemGEi8apmU0502yNlK7SPb8DlQagtWcdhiI1Lj3RBk7L8sdN0Pk7BmTpDGlN9Z
         XBcvhEk5Zh2QSmtOZDqEM04474SGea63pks3PwLPEe6mzyEOWxrgnYQNhD93E+epCji5
         jOcQG5+6P+RB5+DdXKT7D+jc8XiRR8+cp2M8WfUTzGvnPSDA9pc+FOHiHyqE9rqRHvP6
         r75QSjc/emBtQl6K34tFJs/0R6zlYk7PKf4nFUGUfM4tEHQuoH1lF39TSqMHGe9Qd0c4
         BIBQ==
X-Gm-Message-State: AOJu0Yy0BbggP5hITxeoSABWu0XoOy9zIQLWGG12VSJu0EuehEEwWmqr
	TLGhy4Nm6uoj4Ovc76Fw3rv7whncn1fU2chgUdqo+Ai4uv3aONdfx9qG/Vz9eY5T6/VZ0vs1Xjr
	l2mFxdEn8pVg6FaWmTXvtnRZgqR2Tnr26
X-Gm-Gg: ASbGncvpjaE+pDy+Ct2s8S3HExUIB5gVr73wsYD39M8rjoFFe41pjBjCm1nWIv+0phw
	1jqzSUM0V1OnCL8Mc0fcByUEyZ77hkiXU62aB+uYYEvPURjiONy3kmqbK3+5DPeFXEkIh+Urct8
	lQfRp8vm1EpukmLFcc+F7xhEFX8xsvbs8DgDbRZlofJiZ1tOJCckBeZEjWwBJH
X-Google-Smtp-Source: AGHT+IEg1frwZLc21FqPgyEtPAPj1nVsDyh2NwUmkaOEXlbzb+8ABN56ShwCkYjgm5HUmnuiv03QRyXHcB78vMh5goI=
X-Received: by 2002:a05:651c:154c:b0:30c:4346:b1ae with SMTP id
 38308e7fff4ca-30eecdaa35cmr15043191fa.33.1743526184920; Tue, 01 Apr 2025
 09:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Arijit Kumar Das <arijitkdgit.official@gmail.com>
Date: Tue, 1 Apr 2025 22:19:29 +0530
X-Gm-Features: AQ5f1Jo2gpGemlnNWV7BzJv3FbWQ1ys_nUZty2n2Gaqhao9YlD3uaXd9nbAlyos
Message-ID: <CALDPgrtrsa1AzkW0G=z6YCyfuNF3XVMAjfaTnEhf_432THJOPQ@mail.gmail.com>
Subject: [PATCH] i2c: docs: Clarify I2C controller and target driver requirements
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000e9633a0631ba5204"

--000000000000e9633a0631ba5204
Content-Type: text/plain; charset="UTF-8"

From: Arijit Kumar Das <arijitkdgit.official@gmail.com>

Hi Wolfram,

I am a new contributor and am looking to gain initial experience in
contributing to the Linux kernel.

This patch improves the I2C documentation by clarifying that each I2C
controller requires separate drivers for its targets. I believe this
small addition makes the documentation clearer for new developers.

Please review and let me know if any modifications are needed.

Thanks,
Arijit

---

Documentation/i2c/summary.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 579a1c7df200..caca33aae79a 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -60,7 +60,7 @@ video-related chips.

For the example configuration in the figure above, you will need one
driver for
the I2C controller, and drivers for your I2C targets. Usually one driver for
-each target.
+each target is required for every I2C controller.

Synonyms
--------

--
2.43.0

--000000000000e9633a0631ba5204
Content-Type: text/x-diff; charset="US-ASCII"; 
	name="0001-Added-a-small-clarification-about-I2C-controller-I2C.patch"
Content-Disposition: attachment; 
	filename="0001-Added-a-small-clarification-about-I2C-controller-I2C.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m8yqfdq10>
X-Attachment-Id: f_m8yqfdq10

RnJvbSA2ZTRmZGRjNDg1NzZmMjQzMTcyOWVhNGEzODUxNTZjOGMwNDYyM2QxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBcmlqaXQgS3VtYXIgRGFzIDxhcmlqaXRrZGdpdC5vZmZpY2lh
bEBnbWFpbC5jb20+CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAyMDo0ODoyOCArMDUzMApTdWJqZWN0
OiBbUEFUQ0hdIEFkZGVkIGEgc21hbGwgY2xhcmlmaWNhdGlvbiBhYm91dCBJMkMgY29udHJvbGxl
ciAmIEkyQwogdGFyZ2V0cyBkcml2ZXJzCgotLS0KIERvY3VtZW50YXRpb24vaTJjL3N1bW1hcnku
cnN0IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9pMmMvc3VtbWFyeS5yc3QgYi9Eb2N1bWVudGF0
aW9uL2kyYy9zdW1tYXJ5LnJzdAppbmRleCA1NzlhMWM3ZGYyMDAuLmNhY2EzM2FhZTc5YSAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9pMmMvc3VtbWFyeS5yc3QKKysrIGIvRG9jdW1lbnRhdGlv
bi9pMmMvc3VtbWFyeS5yc3QKQEAgLTYwLDcgKzYwLDcgQEAgdmlkZW8tcmVsYXRlZCBjaGlwcy4K
IAogRm9yIHRoZSBleGFtcGxlIGNvbmZpZ3VyYXRpb24gaW4gdGhlIGZpZ3VyZSBhYm92ZSwgeW91
IHdpbGwgbmVlZCBvbmUgZHJpdmVyIGZvcgogdGhlIEkyQyBjb250cm9sbGVyLCBhbmQgZHJpdmVy
cyBmb3IgeW91ciBJMkMgdGFyZ2V0cy4gVXN1YWxseSBvbmUgZHJpdmVyIGZvcgotZWFjaCB0YXJn
ZXQuCitlYWNoIHRhcmdldCBpcyByZXF1aXJlZCBmb3IgZXZlcnkgSTJDIGNvbnRyb2xsZXIuCiAK
IFN5bm9ueW1zCiAtLS0tLS0tLQotLSAKMi40My4wCgo=
--000000000000e9633a0631ba5204--

