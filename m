Return-Path: <linux-i2c+bounces-10769-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0479DAA9490
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 15:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 195E93B8D37
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 13:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D568259C92;
	Mon,  5 May 2025 13:30:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627A2259C83
	for <linux-i2c@vger.kernel.org>; Mon,  5 May 2025 13:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451803; cv=none; b=pt7k6hEZ94VTOWq2GodGY+lFpjGy1nJQwauVYtWY1m4kcKkJj21gYXdHm08PmQ8RbcrF4MXT+o7+/I8NzouYmtQHq+VFPK7anKEY1hOeejzHqtdDuJp7fNzJHWqQVT2A1Dw3Yut1W9EpwbcQJ24T9cVFcaBpZh60o3oUNT1OI64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451803; c=relaxed/simple;
	bh=nxv8omxoWylB/thmP6M3rQdOrACdO/QSPsp7iDIySd0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZwLHg0l/4v6FAsMaCS0vi/Myhz4dSQh9NaFf6DYT/UrNEjSnooi31bER4Bgx1nwxH/HywcOxUOExPht72RyDXv6tOnyZRvWI+R2cttIQoDUn+jL51+7UDgtB8Z2uyV0LGAWtwG0jKvttqnC8cwtVfhl+s37Td7mVKLK8i23LCdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvsv-0001kY-OL; Mon, 05 May 2025 15:29:29 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvsr-001EmE-2j;
	Mon, 05 May 2025 15:29:25 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uBvsr-000KtU-2N;
	Mon, 05 May 2025 15:29:25 +0200
Message-ID: <a21bc1518141c38b064360ff4c2b7953bfdfda41.camel@pengutronix.de>
Subject: Re: [PATCH v2 05/10] dt-bindings: reset: sophgo: Add SG2044
 bindings.
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Andi Shyti
 <andi.shyti@kernel.org>,  Thomas Gleixner <tglx@linutronix.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Samuel Holland
 <samuel.holland@sifive.com>, Ulf Hansson <ulf.hansson@linaro.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>,  Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula
 <jarkko.nikula@linux.intel.com>, Jisheng Zhang <jszhang@kernel.org>, Chao
 Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org,  linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, Longbin Li
 <looong.bin@gmail.com>
Date: Mon, 05 May 2025 15:29:25 +0200
In-Reply-To: <20250413223507.46480-6-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
	 <20250413223507.46480-6-inochiama@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Mo, 2025-04-14 at 06:34 +0800, Inochi Amaoto wrote:
> The SG2044 shares the same reset controller as SG2042, so it
> is just enough to use the compatible string of SG2042 as a
> basis.
>=20
> Add compatible string for the reset controller of SG2044.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>

Applied patch 5 to reset/next, thanks!

[05/10] dt-bindings: reset: sophgo: Add SG2044 bindings.
        https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D1c64de886b88

regards
Philipp


