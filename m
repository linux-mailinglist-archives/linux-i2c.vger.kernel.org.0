Return-Path: <linux-i2c+bounces-9647-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05871A49D0C
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 16:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D58D21886FC4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 15:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C4B1EF385;
	Fri, 28 Feb 2025 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F93+1UmQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FAE1EF361;
	Fri, 28 Feb 2025 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740755859; cv=none; b=LG0rcxSoDHD06sKRZveIjCLvkNRdRy/HsHihtr8rvstwltu6n6aSKJPKOkICVpKEt6f+x0ZqyPDmcPI7qxNnvPjRxz5NxwWpX9NlpXcDBag+2d9q8XR1ZjpyqjqiA63ChZ+RbIz+6mP4fgX4Zi/YCPclMGYB2Vyn3q/vDzwNV0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740755859; c=relaxed/simple;
	bh=01dl+3lQwuY6uBALC/4WP815xJ6lQ4bNJlMaLAN01Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMNOG2qFkRcsvK5L0+OECI+uprezFzNJALvnSvcfbLxhGZXN5D10rP4fCyi76IPWP7OYPrNt8/qe86RCGnUKHd7a7nWYmTswO+m1E1DKb7s2NKn6sQCweLcHZP7nVFJ7hZhQWJaQMdnNrpSe+4Pvg8PBEX1pdhYtEI+r2qOuLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F93+1UmQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43998deed24so21654915e9.2;
        Fri, 28 Feb 2025 07:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740755856; x=1741360656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXvAThfxQoqwd3K3FErjy0bz1DBDFY/uLOknqPH/EhM=;
        b=F93+1UmQ/Z++VtJW+ImZx2KYiWjSDDGK40LQ8FFR70YDo2FRsVVnZYXkQDa993z9Ld
         THhWHh6pOUcb5ELcF6chAW1Q43oaLFJGxGN8E5Ni1P490kH7m0bMGb8Sr5I+1ZyzXQ9v
         vjramRxWO+Ps03Z6jDJyfv2987ouiaepMMqDrJkh+8lOoStoQPwLgLWxqgl9IkpWeFlu
         lleIzwdAwtvXvbHWAhOdpz4HL+8xUwliNAwwH+rfUKxDrO0AZ2Use/DO7b15XZfc4OUn
         mg3LD2bYdoROWHMKn6ABnDsZxdFbpN5ZxK8HLuAjK3dUIilCMXZIt8lETg3LPyUS5qfb
         a2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740755856; x=1741360656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXvAThfxQoqwd3K3FErjy0bz1DBDFY/uLOknqPH/EhM=;
        b=qq/mL0U1KKkr7y3tVZx7Ejo2ul/k1dot9DNChYHtzv87YrtreT9zd78lCP9kkKk72C
         rAA7xLdOcoPQLrOWQe3TDlP4S+ZPIp1Jsb8ef6//UNT35CvDehIlidDeqd3eYmGYGxaR
         xrLrFmAmPqbkonrcq/CFV65jWLYxlYZBt5DO3lXQCCRZzsXzxy6dqxawj2qI6V4TESZa
         MTxhYDw6AJl415rGoSVRFlk4sphzj73S+NMXjqsOVFkLh4noaDhYWVL/KnrEVZZOI77/
         ikcXMLJ69Z7tzwAVcarbNUM844HwrMzpvJVUZatEPDh39+Ne6UC+82y2ngH4XYPmY4/6
         orYA==
X-Forwarded-Encrypted: i=1; AJvYcCU+WpIN1l6DYUeYVcHitb2dowNwYNw65fBwUnZSnoZLTIp3ysHcIoxwQ1+m9ogq/ilWZg4tbwNkmDdFMT4=@vger.kernel.org, AJvYcCVuzMXP+R1nhVrExBc/7Y1Zb4jnfAUen9y+9iW2tciSUIHKkM4HGKdBJpSBb9ke/vvs8k09YWKBIRE=@vger.kernel.org, AJvYcCWo5BZm68dvTPWDuYER2po37hKOJdmY9o3yxtkGaYEXAwiue4S1XyyEbyIqc6qLpGcRCb/J0xS6SFeAqcwn@vger.kernel.org
X-Gm-Message-State: AOJu0YymO41vU5b2Bt+gP5M3/8G+/6kqMuFvOU2FHuvzcNWqxxw2ANSn
	i6duYooiaTZ9v6kwa+yfc2AmMoBG4Yef4dqxzohfch+2A7S86gcx
X-Gm-Gg: ASbGnctCPNpN8Fea8OsjCFahWkNxSybMfSH+4jP+dShw+HC4hKeiF3/m/PPfYdyBILf
	kzMp60wD6vkGQzaNjRAsIaNtTT/898b+4ps9uJQ00st0gXpfsDi7Qm69dKDiqpbcKIGCMtbMX4H
	l/oH0F9SCsOf0zhlPQ5ipQKeYZqVjzpN2TOIdP7MeDmRnFDedTY3smD1l99DkAIHxl9O0WM3byD
	Agr9xseTYxpyRcR9xPir0L7tFbDELqOs7p/NEtuy124gojUZiDzlX2Qf2gza6rv4nNklToxQAlM
	9a9xzZgY1GcFuvQKx3bAEmYUm7g8ui9/JFJwzb4=
X-Google-Smtp-Source: AGHT+IHg8mV3aCh2nKzteGCYnyparRuPDkWiQHP8LX+Hl1SOAz8/rnKHZW/0SkDkhzj8dQzXZRCQCA==
X-Received: by 2002:a05:600c:35ce:b0:439:9537:e96b with SMTP id 5b1f17b1804b1-43ba6709bc3mr34782535e9.14.1740755855612;
        Fri, 28 Feb 2025 07:17:35 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm63096825e9.0.2025.02.28.07.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:17:35 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 0/9] i2c: atr: allow usage of nested ATRs
Date: Fri, 28 Feb 2025 17:17:17 +0200
Message-ID: <20250228151730.1874916-1-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For upcoming GMSL drivers, we need to be able to use nested ATRs.
The deserializer changes the address of the serializers, and can only
do that for the serializers, while the serializers have proper address
translation hardware, and can translate the address of its children.

To achieve this, add a static flag and a passthrough flag.
The static flag prevents usage of dynamic remapping by disallowing
creation of new mappings outside of the attach_addr() function.
The passthrough flag prevents messages coming from non-direct children
(which don't have a local mapping) to be treated as erroneous.

This series also contains various fixes to the logic observed during
development.

This series depends on:
https://lore.kernel.org/lkml/20250227-fpc202-v8-0-b7994117fbe2@bootlin.com

The previous version is at:
https://lore.kernel.org/lkml/20250225113939.49811-1-demonsingur@gmail.com

V3:
 * remove i2c_atr_new_flags(), add flags parameter to i2c_atr_new() in
   a new patch
 * remove "i2c: atr: unlock mutex after c2a access" patch as it will
   be moved into the base series
 * remove alias_pairs variable used only once
 * remove err_del_c2a label used only once
 * add lockdep_assert_held to i2c_atr_create_mapping_by_addr()
 * I2C_ATR_STATIC -> I2C_ATR_F_STATIC
 * I2C_ATR_PASSTHROUGH -> I2C_ATR_F_PASSTHROUGH
 * add passthrough check to i2c_atr_smbus_xfer()

V2:
 * rename and split up i2c_atr_find_mapping_by_addr() to allow for
   usage of parts of its logic where applicable

Cosmin Tanislav (8):
  i2c: atr: find_mapping() -> get_mapping()
  i2c: atr: split up i2c_atr_get_mapping_by_addr()
  i2c: atr: do not create mapping in detach_addr()
  i2c: atr: deduplicate logic in attach_addr()
  i2c: atr: allow replacing mappings in attach_addr()
  i2c: atr: add flags parameter to i2c_atr_new()
  i2c: atr: add static flag
  i2c: atr: add passthrough flag

Tomi Valkeinen (1):
  i2c: atr: Fix lockdep for nested ATRs

 drivers/i2c/i2c-atr.c         | 179 ++++++++++++++++++++++------------
 drivers/media/i2c/ds90ub960.c |   2 +-
 drivers/misc/ti_fpc202.c      |   2 +-
 include/linux/i2c-atr.h       |  15 ++-
 4 files changed, 133 insertions(+), 65 deletions(-)

-- 
2.48.1


