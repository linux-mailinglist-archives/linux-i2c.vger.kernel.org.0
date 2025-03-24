Return-Path: <linux-i2c+bounces-10004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3FFA6E4D0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 21:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 847877A63C0
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 20:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D185C1DDC33;
	Mon, 24 Mar 2025 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgHBZu1E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB41B0406;
	Mon, 24 Mar 2025 20:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742849954; cv=none; b=rdINCdqGPDNy13ZVV0yITsZ/GhHvYEkH0eaC+OZ3qpIfWPjsvg3B4P4YzidbKnuFa/X7Wvkj9Xpa/Ziqi79BV0OVej0DikK0qjhZ4FdWhKaRIGIk3CuHJEn3Ppeu0uApBKpB+h7xzqKvoUnTp+VeMnNwICBUtOSxchbF485Uo3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742849954; c=relaxed/simple;
	bh=9cxWWcXik1rX2/ty6xUvjPaidc1l7hpEbS23LAMOMRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gu7j5AQ2lamt7/9R5kA+1G1pnhXIuwFRQF+DIkbNMpXVAlBD9QCCOSFKQW0HqybhCeEe2BYTFmBvVgkwmxmXxwxONXZjPydZVRsr76HYOvW1da+izZvzacc190KPnK2hx4qHvHMvAZi+LEIZnj0Lyvmpr8uKmExslDhqHa2yE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgHBZu1E; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227b828de00so30171605ad.1;
        Mon, 24 Mar 2025 13:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742849952; x=1743454752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=002VYXfVkW5llc3Dj8Pb1vA7Q/1HSuDmTY1op4WgSSw=;
        b=YgHBZu1E5nak2LAr7IaKxFqhzb+8ZxDyUdyTDECGkk/HQOBs9DMiS6UW7kRox/KB7m
         BMoRAF6ttmuClvrZG+FKuwPLJL4SpfrHE2X+TLW6hgJeqgp5zX+PaX7DNipCP4hJf/mx
         qPVRcCTP00TvEGajcNpmRzZbK7wqV0QIF21B36n9eLXOxUxhaD0apjfRjPVvF8ca5RfR
         3f/tmp69jjOQQhJP+h0gU/fCRBAzxEcb/9lxHYo55mQzf0dMTEogu0ddc3VfJsAw8sP2
         gBeC7SJSmmj8HiXOZustSe6JBp7IBkBOrHqy00WEZ7OgCPsYAz11lQNU8xcYLxFRBpTh
         1JZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742849952; x=1743454752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=002VYXfVkW5llc3Dj8Pb1vA7Q/1HSuDmTY1op4WgSSw=;
        b=R/+F5HPH+hGZRKJYlr4+NmVGcsE/de63DEVD2q18ZFKyyhzcx+68ZM6CQ4Eg1Kv9W1
         p3U8JPQwJZ/iPeYOJ7mlnsxdyHyZRPDT3q8gTf0sUHb5yThn+Pan/3/OjVz7h4KRuc41
         yiwNzJknq0WdefHzVCbdHS5GB0ilUEQ71JM771wQzDwIYRXfY2BwBELWDgyRdnlcNXO/
         RNOb1KnKMtJw4xiND+xaLyGJUUqTDTEXz5eXqLzE6zAghhpZH5b+B+cvLtClYyblW9eg
         G/ckiIcdDWThLgUh07BYxLTTno+hx9smAoIKoA6A/heu4YsMcT2365AimNNoIrkLHXwe
         Gxxg==
X-Forwarded-Encrypted: i=1; AJvYcCXi20tiyDQ0ot2vx5xJWP0RM1cKWMemk459MDpHFovxu8GbD43SmKan9H1OUPPHY857WtkJ9dnBB+yXLYLS@vger.kernel.org, AJvYcCXpVqG56+ViSd3NcbO20gpF/OBPH77HG5yk0Iucc8hl8KUT+h4979VFT1Me3RrI9dUFVV6CyAiCYiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl3X+aN36bxGmiuEkaf8DxPmbYJZdtaMUd+YVizHWf/hpnEXLW
	0YJaevn+ZWOOyodH96Slnt94d7AeHAwl+F/qWKoX7GnCGXzNGj8haz/8hbhlWYc=
X-Gm-Gg: ASbGncvxHTI1ncNDS4lPgg210nVUENwNTBjSt5o5wExA/i+w95Nc1pGcwYE8XuXk2bM
	iBkprWUhyh9/eXPpaT3dgBbxjTRoZbuhdiUA/UT8T8DBryjtYexGZyjGlmobRGf+vdUpkAGga6X
	YIjEMzy9mglaoYivigXlFP5/iaGocdo356PEisscPfcHsjDaa6t1nGW7hwBHMz1gQN4DvO4tOu8
	JCt8YuqlA/s+8hkmTzG26noaCl1rzK2wvN/0ohAzNyeoyAywhlhPAyx93ntIBCsrfChDYdSh6yE
	sW6ad5G+OEnt+m5QGHyC8D1cc8HJaA+ZGytitfG4hxxVN+5irfRiZ3Q8j4KgTCsJ0IoNz3ZQkW4
	225rC7wli10XFhwlxlK7H4IC2AwwxvZ1Z9ezoZ6hLAg==
X-Google-Smtp-Source: AGHT+IE/dFczWKVDfiwOTzNgF3uoibJmZJvpWRK1MoiTaUj4WDZC/8QOwCx9QQK2w2qtr1oI3lzDtw==
X-Received: by 2002:a05:6a21:68e:b0:1f3:32c1:cc5d with SMTP id adf61e73a8af0-1fe42f77d7bmr25182031637.21.1742849952415;
        Mon, 24 Mar 2025 13:59:12 -0700 (PDT)
Received: from elbadrym.c.googlers.com.com (34.125.168.34.bc.googleusercontent.com. [34.168.125.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2a4e8d7sm6537479a12.72.2025.03.24.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 13:59:12 -0700 (PDT)
From: mohammed.0.elbadry@gmail.com
To: 
Cc: Tali Perry <tali.perry1@gmail.com>,
	Mohammed Elbadry <mohammed.0.elbadry@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] i2c: npcm: Add clock toggle recovery
Date: Mon, 24 Mar 2025 20:58:58 +0000
Message-ID: <20250324205901.1274708-1-mohammed.0.elbadry@gmail.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
References: <20250324203233.1266772-2-mohammed.0.elbadry@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tali Perry <tali.perry1@gmail.com>

Hi,

During init of the bus, the module checks that the bus is idle.
If one of the lines are stuck try to toggle them first.

Fixes: 76487532f797 (i2c: npcm: Add slave enable/disable function)
Signed-off-by: Tali Perry <tali.perry1@gmail.com>
Signed-off-by: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
---

Tali Perry (1):
  i2c: npcm: Add clock toggle recovery

 drivers/i2c/busses/i2c-npcm7xx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.34.1


