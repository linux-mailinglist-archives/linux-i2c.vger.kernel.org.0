Return-Path: <linux-i2c+bounces-965-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2844981CC69
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 16:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0666AB21041
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Dec 2023 15:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67E22377A;
	Fri, 22 Dec 2023 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KobXDPdI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0B323779
	for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 15:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-55361b7f38eso2444013a12.0
        for <linux-i2c@vger.kernel.org>; Fri, 22 Dec 2023 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703260357; x=1703865157; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0vE0qUHANDbQuKxV+1bK6DFyI9Eb7i7ejrFM5bo0ow=;
        b=KobXDPdIutnZvDGywnHy3b1Y3xS58qGfZDDYhAmmVYKEnt1ifvSn1xHNH1yVNCrLYU
         4GEdfJwoOVYR287RJxveTgvb6QFwLXd6b9jFybsO63TCEze6WKk6hvRQgC6sPx3uYhBK
         6utVvxt4AKgr2CvotRNVm9C94eYjCGDs2QCWSYmz/wXUuro69/g70k8OZJng/3sy9elx
         txGnfy6v/7sV6JCbNAPhUjOLh5PkJi5srBaOTbUs0K8JhRxU7hEeM4EUZo/LRE1Le4KS
         75bEvo3PsUZr156tM5eMQQWADcZhNBvm2KYQgWkt4xno+Ywu5aeoTi/r4FLVTMx26vgr
         yUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703260357; x=1703865157;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t0vE0qUHANDbQuKxV+1bK6DFyI9Eb7i7ejrFM5bo0ow=;
        b=w2wuvS4cFlJR++WAjez9yWDmp3uKh4c+UdOhwfL26zeAZKnsFcsWgBZfFW7unP3Spy
         +8XSxfdNdO1jrxESw8CT4nE85dy769Zdg4/wEKBtu/YJb0d2OSgopQ0MbmaUhKVTHUcu
         InR0Ctw03CfcWptrO2nAoyzgL5RzxgDu6qXTOUo92t3Pj1CY3r49m1NgSB1ODeu3Ws9u
         y3U+dZ7+aetrKyK77TThZiNEeR/ypWADGoBgNgxXrbPBSULLEFcWkpEl5fkKTeKy1xqm
         U/0Wu+ReAbsZgP4TZScOhMR/O3IuDdaqAqr6IU17b4bNUngBHoa/KSFSaF0i+9Dap+gM
         4PFw==
X-Gm-Message-State: AOJu0YxX4hBt75T17ytTYNXD1++APJ80RYPOmgqqHNaEgtoKvdKAC5Sq
	+Ap0IVi8mbeJ2ILGIW0DSVA=
X-Google-Smtp-Source: AGHT+IErWTRrLZdnJAJOF9hQZMK817nEEalHJzEoJ9EOZtiDvB2t9vhSVLw4UvqJYglbSf/WVId0hA==
X-Received: by 2002:a17:906:f88a:b0:a23:6321:3738 with SMTP id lg10-20020a170906f88a00b00a2363213738mr727922ejb.78.1703260357047;
        Fri, 22 Dec 2023 07:52:37 -0800 (PST)
Received: from ?IPV6:2a01:c22:76fe:e700:90c7:5d23:5f70:b2c6? (dynamic-2a01-0c22-76fe-e700-90c7-5d23-5f70-b2c6.c22.pool.telefonica.de. [2a01:c22:76fe:e700:90c7:5d23:5f70:b2c6])
        by smtp.googlemail.com with ESMTPSA id az16-20020a170907905000b00a26ac53c2b7sm1519145ejc.98.2023.12.22.07.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 07:52:36 -0800 (PST)
Message-ID: <bdb10285-203b-4f82-ac03-f63c8ec44fe2@gmail.com>
Date: Fri, 22 Dec 2023 16:52:37 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, Peter Korsgaard <peter.korsgaard@barco.com>,
 Peter Rosin <peda@axentia.se>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RFC 0/3] i2c: Enable calling i2c_register_spd() on muxed bus
 segments
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This series is based on a discussion with Jean on how to get rid of
class-based device probing on muxed segments of a i801-controlled
smbus. i2c_register_spd() could be further optimized for the case that
it's called on a muxed segment, for now go with the minimum of needed
changes.

I don't have such a system with a muxed smbus, therefore the series is
compile-tested only.

Link: https://lore.kernel.org/all/a9ab1201-58fe-4b86-81fc-b58ce0b3cd2c@gmail.com/T/

Heiner Kallweit (3):
  i2c: smbus: Prepare i2c_register_spd for use on muxed segments
  i2c: mux: gpio: Allow to call i2c_register_spd on a muxed segment
  i2c: i801: Call i2c_register_spd() on muxed bus segments

 drivers/i2c/busses/i2c-i801.c              |  1 +
 drivers/i2c/i2c-smbus.c                    | 18 +++++++++++-------
 drivers/i2c/muxes/i2c-mux-gpio.c           |  6 ++++++
 include/linux/platform_data/i2c-mux-gpio.h |  2 ++
 4 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.43.0


