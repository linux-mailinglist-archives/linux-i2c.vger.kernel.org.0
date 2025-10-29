Return-Path: <linux-i2c+bounces-13887-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 264F1C19D94
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 11:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 625774E4E20
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Oct 2025 10:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F7C31D742;
	Wed, 29 Oct 2025 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="R2PZTCn8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE89E2FF161
	for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734524; cv=none; b=udbCF0u9FYCqMh1yT0raJNd0DdHtpNgTmqSUrBNI7tp2tirppngjqE8wvUsIEuS9kELns+SSFGW0raxXiQYU4I/NoRZ8kqAlDpgjQnfkCTdrr9E7lNIM5XdDl7s7mgRQj0m/mMIs0eRYWFwMOKAxk/dZZnJiwmiHrkkGacOaXes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734524; c=relaxed/simple;
	bh=AUDqFfVw/6OEV65Z6YZ8rdLCW3TA1z/nedV4oyotdPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tImAZ7guGcUdIOxhK0Tpa79fareGH8lXF31E9071KryN41B516zCoIlQFdIztc26Y3Rkn4QMxzLYQrxvT47fRjpQxe9UiB3D/Jk7FG4+YqZMbRoN/bjt/DxNTxT+WrheflZTptMkV40MiQKMvV7t0eGYf9iU4JcunqnahLMbnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=R2PZTCn8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47109187c32so38816385e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 29 Oct 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761734520; x=1762339320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3X4E3hHQ4vm0fEjCZ5UPCa76r6tX7WxRSfwf39l4Uw=;
        b=R2PZTCn8Vxye1cwzPwcvsrc+w83i+sfM+Ny3gEMZoKT6XhJB9jY48Dkpb/LSg/QUvJ
         D6fpevYhbnAjX431AnxdDnZqyrq7XaDKwQTSRGdzzf7jsa83oGDJd42mQBvDcgHuX0nM
         IQPBqE5nju71NUNhZo+4kseVQTh0qsT58h5WlCUT7YF2OkR5x6F4olpRCQOvA38rw0Dl
         pqISNDaaE1oR7j4ji3PnAICgqdv0cckNx8n96Qa1jvM/FjYGb1f96RWaGPeeecO+0/Qt
         BV17vFTHxIQr0H4VQDeDTMZmaro4UVMmeWkIGG5aaq71LH4i1DBSWX7wMxI0GKqB01il
         Hq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734520; x=1762339320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3X4E3hHQ4vm0fEjCZ5UPCa76r6tX7WxRSfwf39l4Uw=;
        b=mECoaoGRAph5MbWIDxFNQs+9vBPVbAhOB74MRfoUYo1hNXTsteyFfuQ3NHbQErkLFi
         MRcsj3H1f9q2ymVzi+fbJFybi8lA5fkYNIJaJQAVNa6Bcs55WvTj3J9l1kfYYgQkJ25R
         W9JE0wDm1jtF2tltIB12cYqSQpgRpITxDVtgRmvuHR4sOd/4kThyQDgYRNQ4tOKsSRM1
         gDdjj4YwkxZIOAr5vmk7BcOeni6oFglJ9Savgj0MPWak4RvhYqzPvJ1KhVGv/F1kbFz+
         wFfI6pqGkuH1uCM1JUax7XzSIIgE6CvzsUUJ8w9/odCCqUpPrpCS21p4X2HzPC0JSZNn
         iLGw==
X-Forwarded-Encrypted: i=1; AJvYcCW6LK4TFbP6E6SmvUBRaOsz78ZlLHZYSSKuQoL5fUwVuYkRYFgWA8kYSZma2U1FzOK48Wj17cIREp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycdQZeT/eh2CfQ96/S4/lOYs3cibEjSPiOdQRmChTjz9fLwTF2
	LIlsHdAeG0jsxZxGDWVM/n2n6eHa39m9WfsT/CbGltGoyRSvvAT+KhTVDSdXj1zkOH4=
X-Gm-Gg: ASbGncv6N4mLCh1EKoGZ0Wx6ki6Hbcq3MkBke9yRmKiOm9RetFoFdDjltlVOa3DNyGY
	JVhZ2rWdsqYEWsSXpDPw/aQqLY0foyCbjUc4WolojcAfpwVCPX48LBB0QDu1r19rmSYQPr/4cya
	jcqJkRdK22F52TZQ7VMiX8KbxLK6XSKBUBLftxLiIsuI706r0KMYpN4mAvz5i8fvzLLkynuKYAh
	mm4FGmF72miFVHgqllHP0zM0nykxJpCAI0JKz1L//yh+6YFRjfNrZHnvdE8Idh0or0UD2WnrCdA
	shuay2+HtQkxSrTDelje1QBk+14S/1dliYVQ7sAKwf5+NppuTdRn3xDGnGZz2DhgpYGaHfZjqhU
	nIvmVCZpX4G4GGJWuiKGRbrgRhZ9GfHnew1i6fAAdKbST7vDv+QwjEn4byX85qT43iYvRT4eSZN
	07IIMNF9BN1p+K
X-Google-Smtp-Source: AGHT+IEr0/AZFy2/29X+tk87HEM/p5Fa5fWpVSnd5/YgcWtERKefh8/xi2PyHwwU7M4yWjRk//ZiAA==
X-Received: by 2002:a05:600c:3e07:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-4771e3fbdcemr21558395e9.33.1761734520102;
        Wed, 29 Oct 2025 03:42:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69f2:5f2d:9ffc:a805])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7ce1sm25165417f8f.0.2025.10.29.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:41:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca@lucaweiss.eu>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/7] Camera I2C (CCI) enablement on MSM8953 and Fairphone 3
Date: Wed, 29 Oct 2025 11:41:58 +0100
Message-ID: <176173451403.17889.9951642355826230455.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
References: <20251028-msm8953-cci-v2-0-b5f9f7135326@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 28 Oct 2025 17:40:45 +0100, Luca Weiss wrote:
> Add the compatibles and config for CCI on MSM8953, then enable these I2C
> busses on Fairphone 3 and configure the EEPROM found with one of the
> camera modules.
> 
> 

Applied, thanks!

[3/7] dt-bindings: eeprom: at24: Add compatible for Belling BL24S64
      https://git.kernel.org/brgl/linux/c/aef72ebe9c86b516c6e126d4b453c96496547f0b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

