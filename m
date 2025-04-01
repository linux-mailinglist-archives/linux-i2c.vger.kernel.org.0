Return-Path: <linux-i2c+bounces-10079-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6C4A77D5A
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 16:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 057B4167174
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Apr 2025 14:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 488AC2046BB;
	Tue,  1 Apr 2025 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoxX2dIb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFA11FAC55;
	Tue,  1 Apr 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516626; cv=none; b=rQ+hjpygVQ7pHtwusmN8IcoK2JBhwa5LZ4YtbvghrJGEB7zLD2jrMG7/iU+d7xTsO5cS0FczADRwO6VGPDXiDPLCGvd/U7xgW00gre1JBvYQ4cuJQMjV3DWRayJb2XFhm+6mHgDpAwPfzBtgmQXzG5GfDO1aobk927zfZ36k15o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516626; c=relaxed/simple;
	bh=jLjkyOQuOzBl4oTWHSyJ7vkYp1bKwM67FwX5cSCD6vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOwvwiPMe8q7/HFWLXgNm5sZKcfbWGGgi/egP2Qrypt8Hb2XVLwpPVsuezeLVnY55/1/SdaRO4GiSf3Unu4P4QVYz+Jkidd2f+ofqs+7jNgiWl+lvN4agngQb+O3TJhMp68NTZa+W9mGreGodgjFfyQko0sleUZrIbe/THuIxuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoxX2dIb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F457C4CEE4;
	Tue,  1 Apr 2025 14:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743516625;
	bh=jLjkyOQuOzBl4oTWHSyJ7vkYp1bKwM67FwX5cSCD6vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VoxX2dIbEW9bqMjkL0WMPeD4YIvXgphDS0TT/yVI4schin0F26yJ+22HXWV4eklIZ
	 M6F/ldkGjXQPYKtCr8rRe/pEPJqJaBm+FK+xOztmRAFJWEe3gYKGG0ovI1h4iwE9+E
	 uU4WRHZmn+2fXWyGtnqIAdH0KoDsurqBqCxoSxwB6XmtJsSL+6phAAgepkpyAGO68z
	 4Qg/lGuvQgGkkE0HC5UcB7CeMjr4jbqLH7ICgNMSJ9XQf4kbiUhphLuo+6u+/wRwBM
	 Sm3JICUecmw4FSscPUTFhVw8Xw+k+EGKKGYhaBPvtHfdkS2HH1rHw1V/JZkE2p3Y9K
	 waV3H39f/bsZw==
Date: Tue, 1 Apr 2025 09:10:24 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] schemas: i2c: Avoid extra characters in i2c nodename
 pattern
Message-ID: <20250401141024.GA3313904-robh@kernel.org>
References: <20250401081041.114333-1-herve.codina@bootlin.com>
 <20250401081041.114333-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401081041.114333-2-herve.codina@bootlin.com>

On Tue, Apr 01, 2025 at 10:10:39AM +0200, Herve Codina wrote:
> Current nodename pattern doesn't limit the end of name for an i2c node.
> It can match 'i2c@10-foo'.
> 
> In order to avoid matching to an incorrect name, avoid any extra
> characters in nodename pattern.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  dtschema/schemas/i2c/i2c-controller.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

