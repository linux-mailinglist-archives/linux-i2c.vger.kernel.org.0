Return-Path: <linux-i2c+bounces-4658-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEF792837D
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 10:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD931281B30
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jul 2024 08:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBFE13AA2C;
	Fri,  5 Jul 2024 08:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="yRftDw44"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2860D145A06
	for <linux-i2c@vger.kernel.org>; Fri,  5 Jul 2024 08:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167330; cv=none; b=Xyft0xKXdiBlgs5ekLnjZvX/zjbxcO7ihngZaeRbwVRblPcTPv7YhYZgPLbmEbvpnu/dla/KIgJ9ojW9JHGt+xUT+2nzFDCFm9lE7wRu39gLLfeFc57MDANT0TC2eQFcJa2vuGhQvsplgj5csdjj2EsX4EsXfT+9BXd7IVB1hCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167330; c=relaxed/simple;
	bh=v8uY+U/v4+/KYsVNbjOHBixlT8XUI33ol/EaZdCKegM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGD7oOLbWSXB7Q2b9hvYa9Torn0SH+l+syceifLrRx+m3rK/5MVB/DQu92h9aVLZOzTEWVpj56kOu4PBfUkYr6LM6n8Iqzb2e5y5ZpnqMUOhVFKnL0KVVvQwKUl5q5zSVPV8Z2aU4O1mUOwl4bAFV7LIPq0tcXHLKjmLU/DfsVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=yRftDw44; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720167327;
	bh=v8uY+U/v4+/KYsVNbjOHBixlT8XUI33ol/EaZdCKegM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yRftDw44XUiLlWLrX1YfppGXXmiox/G5KErBQtxov/tSW0FpUTaJoq6CfUwQCPKwU
	 edEbkH9tzV+5WggOnuTENFXqsTlYbGlXSbl7L5XeA6fSQrBZdJlqnCp5OCXVeAnEkq
	 3szApDyjE2DtOJNW7TdJBH0N86RAnAgiAjXmTyjIYrXHV9IAtWtI3CHGJiX1bfHnlO
	 5g8pCXwOYRCwr8Y9Hu+qKbkxWH7PYXfVRs80xyiHuQ5NAbltIxSV53/wC3RpakkRRK
	 mD2yWrQLaaPgEYesHj9MtZHcnDYrMF+FG0DS6tHrSG/Xtw72xUV4kaMpMex91QOFJc
	 jOEKdijsOO/ag==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F3033378219E;
	Fri,  5 Jul 2024 08:15:26 +0000 (UTC)
Message-ID: <3270d54d-daac-4bb4-87ce-7525d8bf3302@collabora.com>
Date: Fri, 5 Jul 2024 10:15:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: mt7621: Add Airoha EN7581 i2c support
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-i2c@vger.kernel.org
Cc: sr@denx.de, andi.shyti@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, upstream@airoha.com,
 benjamin.larsson@genexis.eu
References: <cover.1720130844.git.lorenzo@kernel.org>
 <a2d319c12b7f4ba561e448e5dc4f0a785a5985c3.1720130844.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a2d319c12b7f4ba561e448e5dc4f0a785a5985c3.1720130844.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/07/24 00:16, Lorenzo Bianconi ha scritto:
> Introduce i2c support to Airoha EN7581 SoC through the i2c-mt7621
> driver.
> 
> Tested-by: Ray Liu <ray.liu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



