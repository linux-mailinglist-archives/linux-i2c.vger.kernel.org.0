Return-Path: <linux-i2c+bounces-4810-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FAF92C641
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 00:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A23691C226DA
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Jul 2024 22:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55730155759;
	Tue,  9 Jul 2024 22:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lit+yIT+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D1515099B;
	Tue,  9 Jul 2024 22:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720564408; cv=none; b=AoRmGtvClkjGi5fqqJ6UpVDrkcwgqn7S6QC3plegF1tmcFTe/qDXdwTx7uI5AWjDbHBVlo4Yy6S6QRL34y5MPtg1G5yzVn9XWURHy45/FWuGjy6hRs/t1QzHEEfTC+zNWEshuvzqWqxsurlr/dhZs7OnitwX9Kv2jV6dBNXyLn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720564408; c=relaxed/simple;
	bh=Q9uQCOkKIQfSM3BkI3XEz9JcNu77rKK1xtXOuK11mVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eu7VWqDPlzuKjKZnz9xNJSaFdPXpki/LkCBfUNer9W+4SCcQMfTBefT07YUjZM0CCnFmMY+EVaooAtANkG6LXaIZObU1gOla7xkNeIcxB3AsUaRD83R/r8BOcCqQrtgX3XuwqX8m78DWTEPvhMq40d4/gl8K1ZCxZez3Az1sLC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lit+yIT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F21C3277B;
	Tue,  9 Jul 2024 22:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720564407;
	bh=Q9uQCOkKIQfSM3BkI3XEz9JcNu77rKK1xtXOuK11mVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lit+yIT+eT3ELb6f+JhYW+NMJGC2EsP/CmTrI4u/abUiflzQu/ZVXz2MZcg9FcgBL
	 NGGGQ8EYw4NQ4/ScxqsQn3YU6XoWlU7W3tMifW0nzYS1wUErwNPACU1i5rX80juo6D
	 7viCGJBiY1iLCMu0kumibWlvGrmVbK5KnuFU2zokri513QTeogKsLV4p6t5yyl0CTi
	 hxcSv2wjwEGHNhm2gQK6/+MwGoslLJxH7xzEMZYpjRCtUIZqg4dAKvCzp+IMOZJZjc
	 X80QBnct63YMKZOJIGzUzTJTf7CLFZC5CGU2rkI9+rk4A5XeId3RSTY3SO2wnv7mGI
	 zXCwqUJZ/Tj2A==
Date: Wed, 10 Jul 2024 00:33:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 1/2] i2c: smbus: remove i801 assumptions from SPD
 probing
Message-ID: <dbajkputlzoqukkjymfq7jd6jb4hz3o7q2f7fsbany2vqcx5dj@xhwltuotxqr5>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
 <20240709-piix4-spd-v3-1-9d1daa204983@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709-piix4-spd-v3-1-9d1daa204983@weissschuh.net>

On Tue, Jul 09, 2024 at 07:35:35PM GMT, Thomas Weißschuh wrote:
> The check and warning are very specific to the SPD usage of the i801
> driver. That was fine as long as i801 was the only caller of
> i2c_register_spd(). Now that piix4 will be added as another user of that
> function, the check and warning are not accurate anymore.
> Instead of introducing a more complicated calling protocol only to print
> a warning, drop the warning.

Well... it's not just a warning, it also returns.

> Even in cases where not all slots can be probed,
> then at least probe the 8 slots that can be.

I'm good with the change.

Jean, Heiner, any comment here? Do we want to add an extra check
for i801?

Andi

