Return-Path: <linux-i2c+bounces-2576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB088A282
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 14:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13A562C1D8F
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Mar 2024 13:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC081442F9;
	Mon, 25 Mar 2024 10:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NneBBH1/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B67158DBA;
	Mon, 25 Mar 2024 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711353986; cv=none; b=AAQrX8h1JNDB15TxKro0ekyneWU+2vjjX6fsbxnU3cMspBirAMNghYGqpp360MWqBkVB5uw9NUfr2ll6e+Zs2DYB7UPzXcb4X/WnAcAmzXpVkWUQgD1TOAZywdLObO9wR9bhHKYVmCwEo0tzDpTgUe5zZVwSja+Wf/7EHq3S1+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711353986; c=relaxed/simple;
	bh=4zmNwnO+rlwZyxMm6+DHyTmsDyPlSk/+VuFi7C20klI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W9QTBa1ykrg8/BNA3vNMGNxrOYmpvz6BXb3gest016j4FT2rPUZ6+6ayddkT4XpL0KzqWUqjgf4spkSCKHL8Cpb9kFHw/2RBEoYoxkSg0Son1YmP4e09qxnMcnEEe+BLEFS2pLo/UhmUhEPms6j2UF3hHsSFN04Kw18Y7dsltYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NneBBH1/; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711353982;
	bh=4zmNwnO+rlwZyxMm6+DHyTmsDyPlSk/+VuFi7C20klI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NneBBH1/h89T+j8vTmT6EtedvI9yYZAzutka6W/6D7Azt/SpnEBfLrj3Rf31qe1BK
	 8pNlfz5pMi5SVO6por8o+Tf2Vfu7GXRczRiPuFme4dA5azM07gValBgJiWdv+wX7j3
	 liU7jCVPtS76l3gIFZA0nNGmcPcsJU9SXbxn8USTUWt2pIelgXDmY+/61QgG4Ms5nq
	 96eFz9So1oipSkAyUQune5KoKumV6TmMCThnk4koZ+dEE38vVNjoHMeeP0oepeWx0J
	 qhCp9hYxXtyGNfX58ByaC70YyMA02/AMmx5wNCly91HUdhTzYlgpHYsUUx0Otw6RCx
	 q7zcTbJUhk9yQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1EE313781013;
	Mon, 25 Mar 2024 08:06:22 +0000 (UTC)
Message-ID: <97b5904b-af1f-48a4-98b4-13d0531beece@collabora.com>
Date: Mon, 25 Mar 2024 09:06:21 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 37/64] i2c: mt7621: reword according to newest
 specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240322132619.6389-38-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/03/24 14:25, Wolfram Sang ha scritto:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



