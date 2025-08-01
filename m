Return-Path: <linux-i2c+bounces-12105-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A8B180FA
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 13:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1FBB163DC9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Aug 2025 11:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995B523D28C;
	Fri,  1 Aug 2025 11:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0fWltIj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3F0221FCA
	for <linux-i2c@vger.kernel.org>; Fri,  1 Aug 2025 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754047282; cv=none; b=YFo4Hs4DOZwdW0KIKpdumaZz93ZSIcRWNGE8nx7iBin7MWzerqPKHEA14+KLLrZ78w8fpmobnn0RRg2tb20Q2l7h3a67w8n5X1IPlYhh5dbCxYK9QkjTzLlfCAVorlakuCvgY2137AuZaLp1PnK481n8Ngq2DkYoBEwaioBEGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754047282; c=relaxed/simple;
	bh=8JQsiVWTM3ruJ2jFKdGrmV8VbBNegx7F5yFOdazGfKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dme/bM4Hqi5h8SAvxYn2PvTN51ZWwL9PLbk8+FYK1S7zqBjNPz+e+0MDPuVRNP26H+5SmXqanOUqI99GjQd/uZ7V1ZRevQbbXfS0B2YyrKFPKlkYE7gtOPzi1O4K89J/UcgJNxvIsF7MqAShPYPIKATcnc863tPArAURZdigD/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0fWltIj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754047279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TkK4LWOcguxSSKDlgoUZDb5ZXpOEItT6YyrOmMD6H70=;
	b=L0fWltIjFHlGyaZMNJ7ifm6mhkaSEzMu+iUYQpeA4Mwk6KVo5yWbIMSou69ksBaC+RYPXd
	xkIZdFSSBg71uVZpXSfcgBrWwFE1TDuyI/d9BajVDIK3oOwuvB/YqqEib6+xmiynGiMbKe
	7eIpj03pKZYhYOMJvNKoOVfgqSHfPJc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-578-Dfo5LgvDPfKPJDVYzXvpxA-1; Fri,
 01 Aug 2025 07:17:22 -0400
X-MC-Unique: Dfo5LgvDPfKPJDVYzXvpxA-1
X-Mimecast-MFC-AGG-ID: Dfo5LgvDPfKPJDVYzXvpxA_1754047040
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3F7B21800350;
	Fri,  1 Aug 2025 11:17:20 +0000 (UTC)
Received: from [10.44.32.226] (unknown [10.44.32.226])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1732C1955E89;
	Fri,  1 Aug 2025 11:17:16 +0000 (UTC)
Message-ID: <9af427df-ad31-46c8-8796-3d7ab55ee9d1@redhat.com>
Date: Fri, 1 Aug 2025 13:17:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dpll: Make ZL3073X invisible
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prathosh Satish <Prathosh.Satish@microchip.com>,
 Jiri Pirko <jiri@resnulli.us>, Jakub Kicinski <kuba@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <97804163aeb262f0e0706d00c29d9bb751844454.1753874405.git.geert+renesas@glider.be>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <97804163aeb262f0e0706d00c29d9bb751844454.1753874405.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 30. 07. 25 1:23 odp., Geert Uytterhoeven wrote:
> Currently, the user is always asked about the Microchip Azurite
> DPLL/PTP/SyncE core driver, even when I2C and SPI are disabled, and thus
> the driver cannot be used at all.
> 
> Fix this by making the Kconfig symbol for the core driver invisible
> (unless compile-testing), and selecting it by the bus glue sub-drivers.
> Drop the modular defaults, as drivers should not default to enabled.
> 
> Fixes: 2df8e64e01c10a4b ("dpll: Add basic Microchip ZL3073x support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/dpll/zl3073x/Kconfig | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Please use 'PATCH net'... otherwise:

Reviewed by: Ivan Vecera <ivecera@redhat.com>


