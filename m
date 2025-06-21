Return-Path: <linux-i2c+bounces-11542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A78AE27E9
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 10:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73E15189FC44
	for <lists+linux-i2c@lfdr.de>; Sat, 21 Jun 2025 08:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C9C1C8631;
	Sat, 21 Jun 2025 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBq6hmdY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8571E78F3A;
	Sat, 21 Jun 2025 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750492976; cv=none; b=Aa+em8JrZjTljaufuslajZO0QmdDVxRQD8pfhBg80sAOfKHA8ayvfZVmX1I9ckbb8pYf3Z9Yv+DccSKGO4JKN023S+SUqvNZNYucqwAXhfBntX+sFnuwNRFvCZcwPcmIZp1Y6MapfGl+bl0Dw9KGPj3og5XCv0c1Bu1qqIq0eNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750492976; c=relaxed/simple;
	bh=J8A43S5sbZL2YZQ2prAaDwMBU97QZPOKqyN8mGDG2Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W22uX5VlliZHGu33Ji3uVpQuxDi619EAvaRAKnvtSa7QE1B8Mn3c5F0h0RvgQrtwfKAwPJWXDPNYalEJFD6D/64DK41xHWxRrl29vbBUn8yB4bff+KdYgSVIj12pykz4gQDM3luUpLWfCICTtqdQfX9cmzVUIENr+EKxsbx/FhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBq6hmdY; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2c4476d381so1958766a12.0;
        Sat, 21 Jun 2025 01:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750492975; x=1751097775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mvzxg1criaakvyYttx7b2bRm4XJ4WjO4hy5LV+VQtjE=;
        b=QBq6hmdY0SneqfoOar+53+kLA0oo7a4zkMjk6U6pjorG81fBYj0iZ/6J4I4SXcx0P/
         R70mCEb8jK+AnVg/cjP02L/GDKq6VbI5tW+wP05A2y9+FNGq9kBndazAM587K8CE5DtK
         OrVFuKW3w4Qq/+wWGaYjWoO8Shj4Nf6IqCLEHySq0w5Wwnt50YMnV6tMADdqUm42vscG
         8nRFmUIiMPeDbL5mDCbVUuA8XEi6x8j6veqzdPdyI4R6JKdu5A4MCdvmAVwsjDgLBPme
         44HxK4GPHIBYckODL/Vo8qpAEmQ7Q4JoPvXTq8VBHtY9ZSzKHrRtJ/QUznYeR6u/xN9x
         vzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750492975; x=1751097775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvzxg1criaakvyYttx7b2bRm4XJ4WjO4hy5LV+VQtjE=;
        b=rlp0htm8owTQATPNUCPCxfDjVxocP1sJNizEV7W1LmObm9hGwcF1tnvAzezjVRWPq+
         90qV3FNrx0lkyu4+CsPkKw+7XLNjUcD2fUtDkPvFoUUxOxBVomEYG2BAz3CTkwf8nbx1
         moXSrNrDrxQ2qVu4Kh8gPd/lAaydrg2t4zKxfb4tonr92JmCGTQoWVLxMczQFtZfyDhB
         UmmqKXNTveard1R954EijpRpXGOiT/GvJKENWm9f0cdcET0g9VmRNwLL8NHGiSjPTXLb
         P607E85qeQkE9WGAzvJVHFjG7LWhLcRlbG0I6cLGTjuQqc4zZKdtUoqInyVj/WcSNppr
         7zig==
X-Forwarded-Encrypted: i=1; AJvYcCWBSigtQLOVFb8R4MpGuuBfcpKHuZxm3/WU22G0u5lASd4P08G8Y53iJrkioAUL9bcOTQl/CO3NSiwi1BA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFoaEibEgo7xAAejiodx5CfurKj98nFDza1KIpro2DUPkkgrk
	qI9OFnoOO3WIPrlttbONyC8MzyvISrY+yChXgT1aUsfDO/Wwm46GTKYI
X-Gm-Gg: ASbGncuXsXyS1vZQdRwagFL5FT30at2wzV3j4Jcw7nv9XRiYTCP8lUlRHr1W6Tp2QSs
	bWtG//PQDO+msc+PhcwKka9ySqewAipbfHFv7cIJp0dAjJN4gTnKCwYhWDyAJdPVkACCYZXlhkO
	dI/MkGKR2zfXrdDjJaK4qGUxq32U5Ef5mVPrCVtkzHTuChSKyaXDxoVzoouZOI41Zz/7v/Mlcn1
	T6CURmRFstRkqxwXR2EuTsYEkHjJtsSsBB09Ab+6fnr/bKw6YcRfEQcamfXcWn5eIxkKUlwSwX/
	rud0NJUtg/QBfqnnS6DVMkxEBwzGmh5t1iOeYK/uJYs9aBS/AOpOc8EKbBWSreyRqsteFXpylW7
	UtDO2hnC1Tg==
X-Google-Smtp-Source: AGHT+IFthS9ajgZZShzVqoxrXr3psnI1oJaxz+jRjKjcpG/pueolDrKYIyn88Qlws6c3fNe7xYEG6g==
X-Received: by 2002:a17:903:1746:b0:235:e94b:62dd with SMTP id d9443c01a7336-237db06dfdfmr95191595ad.12.1750492974657;
        Sat, 21 Jun 2025 01:02:54 -0700 (PDT)
Received: from faisal-ThinkPad-T490.. ([49.207.215.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8608e24sm35531285ad.127.2025.06.21.01.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 01:02:54 -0700 (PDT)
From: Faisal Bukhari <faisalbukhari523@gmail.com>
To: jdelvare@suse.com,
	wsa@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: Fix typo in Documentation/i2c/busses/i2c-parport.rst
Date: Sat, 21 Jun 2025 13:32:44 +0530
Message-ID: <20250621080244.158018-1-faisalbukhari523@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes a spelling mistake: "resitors" → "resistors".

Signed-off-by: Faisal Bukhari <faisalbukhari523@gmail.com>
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


