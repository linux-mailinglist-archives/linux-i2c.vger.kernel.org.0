Return-Path: <linux-i2c+bounces-2572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F983889B3C
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 11:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F1841F37927
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 10:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B3E54905;
	Mon, 25 Mar 2024 05:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GgJfJ9is"
X-Original-To: linux-i2c@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39149156F35;
	Mon, 25 Mar 2024 02:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711333762; cv=none; b=cQNMcut4wPiql8+G8TGeefsmNiLcKy/L9M4G4hYWRwBfyWNp1stTiRisX+BLAyF4/QZb6yGPysleiZG9Xm79jGsM0bTFaMrDtqClp30UpM7BdKIDC7XF5CqN1mZE7L1YVA2aTqa9LsiWkaFHkk5iJSnulV1MxFcYYrpdVKb2rWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711333762; c=relaxed/simple;
	bh=h+6XaK7IxAXSBys2cMcf2r6FjybdgZqGRT5bDLSNFUc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mujZamTP5iq/lxgqtWLEcLQD348Owc6Tc3Jf3ez5Yhqxon16uN8Nh+Gcp/qiOzR2ESPzA1BtQGHuu/PNxtuAjc1RdLp6J/HpdwO+T71mIm2PvfZAnVCt6gVVN1918NNig419J411alJqwJu1zX809/hbN5bd5kDPj57ULgMdpww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GgJfJ9is; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 80D0620173;
	Mon, 25 Mar 2024 10:29:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1711333752;
	bh=h+6XaK7IxAXSBys2cMcf2r6FjybdgZqGRT5bDLSNFUc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GgJfJ9isOY7k62lNBAZZElfPt55iMk6k/yyazIYqTHP/jkuu8KG5ZZZBC+eZtaFE9
	 oVIcsY2oxJElrHqJxw3mILN0E022LooGgrmuwNSl9XI8ViH+GEo4GhLC/RDMX6h7QS
	 3+AhjniTgf9kMViuf/bbiuo0TQmrhmWuFy12l734dZOHwVTrcTWIKvxnL+AgVYBpoI
	 LKf3Z93yK20GOrnMpos1ZlUcSSbt9TZlOUTj12HV/LUdj5ELOkbjOp+SNaEKts5SXZ
	 5GunjCFSNV76ZdmCJJT0Nufqg6YOmmtNfDrmgRXmdX2BJD4FclCcPqofB8HkcwTDan
	 gU9mxszo53U9A==
Message-ID: <93bd01d104f752d29d182249773e83c230a3ab20.camel@codeconstruct.com.au>
Subject: Re: [PATCH 05/64] i2c: aspeed: reword according to newest
 specification
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
	 <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, Andi Shyti
	 <andi.shyti@kernel.org>, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 25 Mar 2024 12:59:02 +1030
In-Reply-To: <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
	 <20240322132619.6389-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-03-22 at 14:24 +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

