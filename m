Return-Path: <linux-i2c+bounces-11881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D24AFED0C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 17:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B3501C837D5
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 15:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395442C2ABF;
	Wed,  9 Jul 2025 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwOqsQC0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A128728DB56
	for <linux-i2c@vger.kernel.org>; Wed,  9 Jul 2025 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752073341; cv=none; b=hX9LHg9zgBb0FiZr4b9jYJi5Ebx6WhBQzAq3nxSm9XtkGaT1fXRtSyNtXvCfg6/l9LSgavNok4AWHEI2tSGXYUjGBr7zHi9a6NK/7KzyzekdQDEmqCO7cDE+TbLuqobC6aub6vbJRv95LT+xxITIYy7VQ7y00hwtF7NpglSrIJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752073341; c=relaxed/simple;
	bh=4mYB/weyeypJaUnZWKSAsQpsghFPrFO+EqZ2wFKyYmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+g3DXnAlzOYlb8qrWLgt5Is5vBijGHavlVvaFQcrojkweTgI753nfeyacCA20evIifFxep7dm4SrMuSHLscPyhEOlKue8j9Vx7MCynZIrxgS/76fsnbSMoF0Gn35lbHMjeeBgEQUtLXLwnFpGOlg6Pgmf3BylWZ26P9Tbbfl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwOqsQC0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2350b1b9129so232815ad.0
        for <linux-i2c@vger.kernel.org>; Wed, 09 Jul 2025 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752073339; x=1752678139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mYB/weyeypJaUnZWKSAsQpsghFPrFO+EqZ2wFKyYmY=;
        b=VwOqsQC0yghWPuv95R5vyYiLzuCgpu8Krkcm/PddV2AzaR0nGf62Lg8HlQVp16bz/c
         66IQuFQq17jvTZfURNq5S6D4TluEExhuJfesVItk93hWt6BdQ8UBywLnwe12l7NcWtOh
         50QJuZgUqEXH748or0cU5Z6z1dIsFzxmGjU57Ptc4tBQqYji6MybQiOB7xb2MUitKdpZ
         ywVEs3qgYiMLpWjKVsNfDGELRM4i7Yz/DAIwRG9s0J3SCcPjNAdLsg9rKsU8jN73E6XP
         hCgeZiMf//noxQrD0OCmbzwK8jn+o9/bXa4NzB3DcArt5smMXPka0IXr3Nt0MN9yZVcP
         knGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752073339; x=1752678139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mYB/weyeypJaUnZWKSAsQpsghFPrFO+EqZ2wFKyYmY=;
        b=T9TyVt2VWkV23hhGaZv2sFG90FyVh1tGznz5MFApcYY3dysMxITjcdYywieONdq1ur
         d/BVcWUongQsyu9Xe4xyu6jGt+5ATbufyinqJ8lfTjfrgGs5vxILc8ojpSTu/0DkyQMG
         F8fDPoPzC/L+XQ5CNbD01gsdQ05oz3T5HEbbpnzm3fQnzonnzCqnW2GPb8+tNe+mU2mY
         jC9/ktwpuaxHIwkRKZQ7uHn9FlUavGQWHpkfe5ulwIk8Ya1Z4XwPZA0MFF748xSwqVNu
         fL1af+/L2dzruE39VZqqSk3rM1RwyiIjRBMD5gdjIekzQHNwURbcQIhGmqF9eQiTnpFe
         wmUw==
X-Gm-Message-State: AOJu0Yz0iOUJOMdCajUwE1CGx2IplPtqDaIbfbNa1c74ji9JkV9DwETC
	ULrs2674q1AQnQvD7rlGIKTMl+TSdF2sW3x94a0o2Ctn307e6VEzyiK+hQ+Mgqgh
X-Gm-Gg: ASbGncu8LgxC3/Cw44mFOeWjSDfewWmcQ97fCc8vF5CaMz7dAiOR+0hpfuMYHy240do
	yC2HR51aAyalejf/ZRUf6TqIHdaIgQrvc329Pjzw+fvNpH+/n5AS6dam02YEYy/dFeNlmpUfay+
	KBJWRphzPcPm2NTvdsXsUIuVzpKFOxCa+PJaufqVnHv0ssyQlbUZYNugGHe93NgKbpIgG0IqnH9
	yXqyI9lJ2FebzMTwinaSuO09Z4jo1OJBYZzOUxzp3kyZ4uhy9W0EGdQRa+88/5I9sA4Zt3OWeFQ
	yybgGa8y4gO31v7Pn9AGkzEtlqluvD6PV4u3HJn3MSkUxRCxvOkK1qY8Bd1cY85qG1s+hvLkWC4
	1H/mbkJmbpw==
X-Google-Smtp-Source: AGHT+IHV3EbVnrzeRPqctC9EfwjsOWPb8lLFfsebtuEMIEwCm+CsgeGwYfw4UV7OkplUs5BgLB9a0A==
X-Received: by 2002:a17:902:ecc2:b0:235:e1d6:f98b with SMTP id d9443c01a7336-23de2472109mr3742525ad.22.1752073338637;
        Wed, 09 Jul 2025 08:02:18 -0700 (PDT)
Received: from localhost.localdomain ([223.181.118.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84351ae4sm143349455ad.72.2025.07.09.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:02:17 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	viswanathiyyappan@gmail.com
Subject: 
Date: Wed,  9 Jul 2025 20:30:49 +0530
Message-ID: <20250709150203.7199-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aCtgNpWs1tJ1FltB@shikoro>
References: <aCtgNpWs1tJ1FltB@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Wolfram,

Updated the Signed-off-by line with my full legal name, as requested.

Thanks,
I Viswanath


