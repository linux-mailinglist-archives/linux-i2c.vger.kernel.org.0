Return-Path: <linux-i2c+bounces-10908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A83AB04B1
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 22:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C53E3ADCED
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 20:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C327528C027;
	Thu,  8 May 2025 20:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ig2Jqjj2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22A01E4BE;
	Thu,  8 May 2025 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736438; cv=none; b=WoTeFSXbNGIoj5qfc6rwKUpevL5tRw6xfOG8mL7ubsccx5sJr3PbcfvpBXYdhdGusbUeMEg6KhbmkqpCAiDX7soF3fvnAHIHC3IBUi+qz9PpnpTiVq5jFTTgCBwxf0pNP9dbenEhychnATnbdQNWXj8N9RsPFs9QWzBmfl2MJQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736438; c=relaxed/simple;
	bh=RsUbU+vi9fRQWrbDJCbg63cQUWQXAA2LxbmCIbgPy1E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l9gmyodBa8zRfX+x+jAYARkgUHJeo15e8PNweO8ZR/PuiJxM175xHrRoSz1Few5X8l4kn6Kbxk3ktI3oB/caMwk5LavODYrUjkSIMXdYSG6xwCegtFpjZTPuEPoV3F/B/SAY8GRqkbYeyGM5/hOGjVtkEbsgTy4SCnqTDB6m56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ig2Jqjj2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so999419f8f.3;
        Thu, 08 May 2025 13:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746736435; x=1747341235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFjqdjitOvBr7aeCTW23haxFiv6r9WdSAxPsK6p7yTg=;
        b=ig2Jqjj2LBtBWXCQJRH4UpxEBMJ8Litn4wG2H7eIH/RhrujRfmSOvgcy4A76a2tlm7
         Vh/psUXjXhxuzwel/IMvBkkjhEi2nMgIlGs2VRJ1VNFmQFXFizLZXxC6LSmsGQ0O2lQL
         euCvaWQ/fcpPR/MM1gVahA/Qplhrdnk0iyokF0Fq/NGSHj1cXnMUUovZB7aYK4k9EXc1
         5NfwPLMtK2SEVhksAYTHOs33uXsAsxTd2iD4bVzFgklQCYnARtU3QY1qEM6OT/g2spay
         FOGZa1LyjxPGJcbXQAjZdtypLIYgTq7roEBTTMil8m7UxKTC65dltH/FqwG3Rriuq2DA
         2Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746736435; x=1747341235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFjqdjitOvBr7aeCTW23haxFiv6r9WdSAxPsK6p7yTg=;
        b=ECBnCAtYOFLlr2i3bhXuhiYWE1FCTTBRhwgQ2YH4vdzgnfl1MSZAxqAvH5MqmRKjgf
         Z5+XABtGWjDOp3795KTAquU+XktJ4VCj4ZV/gopfQQucU+wkabDFof2XM5PqgofBXnV7
         C2bu+UG53KWak85WN79jAVbmrrMjuiPKyuPkUYI6XNfNJfJYAhcud3z2jEmgH1OBQ0Mm
         i7566WvC65iKl9NND4kUs3AUZ6JkcCG86GQEO3JIgcOAquR83wpLOnuQzBcxFEqRAyQq
         HObikqjDPDjajWshOUGF+t7nPayCNTUOkzlkhCT6Dly6ozkqVyitXL4BxGOu+ikSlhdg
         hYHg==
X-Forwarded-Encrypted: i=1; AJvYcCV4zZyHVGaAHtAvViS2kdJWXIWfW/HmMWDOElzzgiRKSybrdvywq5G/ABq3TaIl4qQhgy8o/5ihDqIa/Cvo@vger.kernel.org, AJvYcCVQHi/b5g/eNjV5CSu03LhFB0y2lC3fWjVcRMA47raPL2bdEUbtiqwKkpiKSSM/ol9g1PYXngQRaVUW@vger.kernel.org, AJvYcCVifWvjUY42xRxq3QtCDtonXz4bVUnW+Fnww5N2nXiCJOwzDsqazSyJJvBTrGAFwhKz1HqG41NOq97QKrk=@vger.kernel.org, AJvYcCX5qwowhmnd4gRpN+hMaRpd7/qJVtqmVHyjgOpUjgOREL0i8NjczidonRUkcT2GZTgtKkSaQJG4xc9f@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1xAkVgARG8IyD+OZcwTZpMwu1KBoEOhSkdJFs09+c0f6wJb0
	KiCOWhLna5uk4p3R+DP4yQg60jX522/cg+OBMNn5ubIrt0/dpoL5eofQ7Q==
X-Gm-Gg: ASbGncsbkZJ1NsJoOnwCdHdQhUvY5haAN6OXV2N9dBC0oxOcn1GywIZZkxMZD22namt
	RCrl9rTSFP47CpCnGoQNzisrkan60wpBMe4hsTPF0uhFQoFyYslt25yep8GtN/cFhCaJ7u8CEw6
	D4+He9I1y8mtSjA/Gi74VmU9FxuHePElhWvod0dPtiNbxq3fy3D2V1TZeys4KpWlwq1nFeyoo/U
	7KMjZJgoMLMz6ra57Tp9I0KWvgucHu9aGL46zIDbbQPBC4li7s7Uam2jCA+2zd0sGb/hWuXplxp
	7+hyFGIg110/AxOxCS7Gh/6zF6zci2WAJY08g6RQNHy80UTGVdOWB/vIpW4E+RMYZF7/zebSMJd
	FET44NudxqtFEi2/SUbzdmekszJnUFSXF
X-Google-Smtp-Source: AGHT+IHkJjWQMxRmUNg/ASA0bGx2IYBwfPUkW2FOyp76baMhEfIe54RW0bsxSEGZDxO1TZkfWPTXyw==
X-Received: by 2002:a05:6000:2502:b0:3a0:ad55:ca0c with SMTP id ffacd0b85a97d-3a1f6427adfmr768853f8f.1.1746736434909;
        Thu, 08 May 2025 13:33:54 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f57de001sm967343f8f.20.2025.05.08.13.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:33:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	onor+dt@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	ldewangan@nvidia.com,
	digetx@gmail.com,
	p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akhil R <akhilrajeev@nvidia.com>
Subject: Re: (subset) [PATCH 1/4] dt-bindings: i2c: Specify reset as optional
Date: Thu,  8 May 2025 22:33:52 +0200
Message-ID: <174673631321.1562471.9390298143703530461.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506095936.10687-1-akhilrajeev@nvidia.com>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 May 2025 15:29:33 +0530, Akhil R wrote:
> Specify reset as optional in the description for controllers that has an
> internal software reset available
> 
> 

Applied, thanks!

[4/4] arm64: tegra: Add I2C aliases for Tegra234
      commit: 34c6ba89e1487181b4278e5c1b329327439ec715

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

