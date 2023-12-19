Return-Path: <linux-i2c+bounces-870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76E818AB0
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 16:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CD98B24C55
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 15:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC801D546;
	Tue, 19 Dec 2023 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="CwlRqkTU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E41D539
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c41b43e1eso58829935e9.1
        for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 06:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1702997861; x=1703602661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJyLXJjHyNjZ1VnAqQQxxFFoGu1kUjfRr//VUUtUTdY=;
        b=CwlRqkTUKc55R7Cxt9FXTT7qtvTu3kNulduE0XvN3Iwiqi4RlVXid4lO64pbgFp0dU
         YKGaTAfHqgOVdwnnms0KWKKAj/zsSRrNa2X2sIRf7R9V6XDPiuvEK4ZH6d1BZkOO839a
         +XJrkBdZM9ue38qvwLXked1Yrf7pq1OoLgzzfA5/g/boNjAbEsavYmk9nYqRESKKxlC6
         YnfCq2r8LEuSBNWQFb1DSBVuZUdFWAcl0VWWkbm8rFElgbqYqIdPY+RFIYrsO+dcDJ0s
         qQ1uoUh4MnHjorEpC3V/NWqTwOcyT0J7/ecPGTf+UyqNU2uZ9I6erbMDVNj2n6WWEhzz
         0RhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702997861; x=1703602661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJyLXJjHyNjZ1VnAqQQxxFFoGu1kUjfRr//VUUtUTdY=;
        b=mDo/H8cC4yW02xJFJiWnevJBkin6Y1HpFWi1/Bl4uq9JUnBG09OkYYBT6Wqb0TlIEl
         HjkTY/+DaIzALIlcjW7l/3xUMD/WRebxPYvRjoZ1q75TTnMJykES/WCylCx5LyFTTddH
         XcLwpqqxLV/+VdgUnu4xEGL9ktZGcTKpJwSiAFa+pGY6H32NxrBCuQYKQnhJCbHmJLmt
         2oD5oQQpg8dT4IQUndo7GVF6jTiEBeNH1i2CW+0N4hbcIZVuAb5PnKfB13+RvVG7sKIM
         oFoQVle1elSFkNN7H1P94KVUxwzupid41aSDnB/lugfAnJwpdIFfXWblwNceb5iX3vZx
         NYqA==
X-Gm-Message-State: AOJu0YzlXLEfHqutwmfMPGVycO442DpdNZ6yYbSxJhR6iFwRNfbv5N92
	ZF1BKC8joc6ipyHU+T+FRKek3F2DJLrPKnSkHuI=
X-Google-Smtp-Source: AGHT+IEAWiY/Pd0zZygMsYs3U8rqXj91ebxWyGUozce5B0nxQ6Oe2vcTRYbsqtyqcT6qxNsEnnv7Pg==
X-Received: by 2002:a05:600c:21c7:b0:40c:31ec:eaf with SMTP id x7-20020a05600c21c700b0040c31ec0eafmr8930719wmj.205.1702997860574;
        Tue, 19 Dec 2023 06:57:40 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bfd0:6ab0:50e2:7f18])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c359400b0040c440f9393sm3185948wmq.42.2023.12.19.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:57:40 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] at24: updates for v6.8
Date: Tue, 19 Dec 2023 15:57:37 +0100
Message-Id: <20231219145737.30325-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Wolfram,

Please pull the following changes for the next merge window. Details are
in the signed tag.

Thanks,
Bartosz

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/at24-updates-for-v6.8

for you to fetch changes up to c692086d74a0184d8993e056dc9273abe690e315:

  dt-bindings: at24: add ROHM BR24G04 (2023-12-01 10:33:14 +0100)

----------------------------------------------------------------
at24 updates for v6.8

- use of_match_ptr()
- describe a new model in DT bindings

----------------------------------------------------------------
Bartosz Golaszewski (1):
      eeprom: at24: use of_match_ptr()

Philipp Zabel (1):
      dt-bindings: at24: add ROHM BR24G04

 Documentation/devicetree/bindings/eeprom/at24.yaml | 1 +
 drivers/misc/eeprom/at24.c                         | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

