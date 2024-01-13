Return-Path: <linux-i2c+bounces-1286-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C7082CC79
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 12:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33E802841DC
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 11:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A52C210E2;
	Sat, 13 Jan 2024 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+gDhteh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA50C210E0
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 11:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a28da6285c1so1310817466b.0
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705145036; x=1705749836; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uhhu8iejzeyqGDq1pMXtCYwjv781NVjzv8ZIHen6Cwg=;
        b=G+gDhtehAORnhPcw5GZmCkrnkgVVbiIxSyvx7AribltJTMc+6P0lmFM1RwH5Z3D12n
         xIgcdKEe2e7KUX0EuS4FIf6gk9bPEm6Ju+Uf89uvtRCzgwLTmSBrUjg492+5MoX87oii
         DaSeCqjkV98X1JiCMXwluSf+9Ca65uOX3EM+8wP57d5RjVry0IgK+EE8L9eXIATTE/mZ
         JRcq1fgf3ZoXyYenSsW3XhOdMKGq1Oh0BgUA2KL5v1j4Rb1CNH9h9eTv3QGlxJN88J0J
         n744ylTo1hA7acoRJvDg+7RfheX2EHMtNUfWtUO7QX774n0jEpazT5V8uTm0hvHWHXEv
         5+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705145036; x=1705749836;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uhhu8iejzeyqGDq1pMXtCYwjv781NVjzv8ZIHen6Cwg=;
        b=df0jlYOBw3BtRIYlLRn4G4E41GqyLlS/WfqhVwzuoXI6WohZ73SXAjjMlJFNACrHJ4
         INfnkuKmd2AB4IxYqGiTHCbRQIzGRBftyTT+bUtk6Zth0N8hdJ1cCrQFMF8cL/2sn38r
         73iJ0PcW7bmqyStzvwmmqOxnIWAekgxhGgY2YNQ9jGb/44WmKqgI6TsDMZ9V80Q9J+51
         iTqVw7Pc5BjwaUcZ2mttyVqrCj5cYFYGayUauzwuLM14w6GZT1ihn4vJScWOw+x2ZfMZ
         uGOVREE2lktLAmsa7g8igiEeYLvuYYaqSHt7tC5vqxijwZMdG2FQPYaXenPHjCDemqYw
         YEAw==
X-Gm-Message-State: AOJu0Ywya2l84hkwkDoCFQ3blyEV80CSJS7Usk5SAIzx9mqbxOIDv1ZG
	al30rgJg7X2rJKHQCfhOYQc=
X-Google-Smtp-Source: AGHT+IE/s29GY/Ym6uhJSnRyCZiVfvB2/t4CktRTSuELfQSF+hWITLXedbegSLBlA5YtAPv75n+p/Q==
X-Received: by 2002:a17:906:57:b0:a2c:cdef:b03c with SMTP id 23-20020a170906005700b00a2ccdefb03cmr1713951ejg.30.1705145035643;
        Sat, 13 Jan 2024 03:23:55 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f53:1400:a4e3:d977:260a:1bdd? (dynamic-2a01-0c22-6f53-1400-a4e3-d977-260a-1bdd.c22.pool.telefonica.de. [2a01:c22:6f53:1400:a4e3:d977:260a:1bdd])
        by smtp.googlemail.com with ESMTPSA id d26-20020a1709067f1a00b00a27a7fa8691sm2777351ejr.137.2024.01.13.03.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 03:23:54 -0800 (PST)
Message-ID: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Date: Sat, 13 Jan 2024 12:23:54 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 0/4] i2c: Support i2c_register_spd() on multiplexed bus
 segments
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

i801 is the last bus driver supporting I2C_CLASS_SPD. It's used for
device probing on muxed bus segments. Only known use case so far is
systems with more than 8 memory modules (with thermal sensor) on
muxed smbus segments.
As discussed with Jean, to be able to remove I2C_CLASS_SPD completely
the following has to be done:

1. Extend i2c_register_spd() for use on muxed bus segments
2. Enable explicit instantiation of thermal sensors on memory modules
3. Extend i801 to call i2c_register_spd() on muxed bus segments

Step 2 has been accomplished:
caba40ec3531 ("eeprom: at24: Probe for DDR3 thermal sensor in the SPD case")
393bd1000f81 ("eeprom: ee1004: add support for temperature sensor")

Patch 1 does step 1
Patches 2 and 3 provide the basis for patch 4
Patch 4 does step 3

Note: i801 creates the mux platform device, loading and probing of the
mux driver may be asynchronous. Therefore we can't call i2c_register_spd()
for the muxed segments from i801. Instead we have to add a flag to the
platform data, so that the mux driver knows it's supposed to call
i2c_register_spd().

This series replaces the earlier RFC series.

v2:
- remove now obsolete comment in patch 1
- fix link error in some configs in patch 2

Heiner Kallweit (4):
  i2c: smbus: Prepare i2c_register_spd for usage on muxed segments
  i2c: mux: add basic support for calling i2c_register_spd on muxed bus
    segments
  i2c: mux: gpio: Allow to call i2c_register_spd on a muxed segment
  i2c: i801: Call i2c_register_spd() on muxed bus segments

 drivers/i2c/Kconfig                        |  1 +
 drivers/i2c/busses/i2c-i801.c              |  1 +
 drivers/i2c/i2c-mux.c                      |  4 ++++
 drivers/i2c/i2c-smbus.c                    | 20 ++++++++++++--------
 drivers/i2c/muxes/i2c-mux-gpio.c           |  1 +
 include/linux/i2c-mux.h                    |  1 +
 include/linux/platform_data/i2c-mux-gpio.h |  2 ++
 7 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.43.0







