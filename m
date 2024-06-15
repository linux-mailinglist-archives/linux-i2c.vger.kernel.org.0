Return-Path: <linux-i2c+bounces-4041-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C50490995E
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 19:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855961C20F5A
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2024 17:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43724965D;
	Sat, 15 Jun 2024 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqZaocfw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D71EA90;
	Sat, 15 Jun 2024 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718473722; cv=none; b=dcEvXkGQ3CaBTnxCKuzeQUYG9s+x5BUEUqlYqXfUy2Y0O0yU81niTCjbuAbxzzs+gPJlRMopQYDVzA6jZM41tPVwa5I8jmvUE9vi704xnHCymkM3IErRPsVHxHWbGG4BST967aTbi/TlRfW7B9RgafpkPGjTXkeLU58B58WxEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718473722; c=relaxed/simple;
	bh=9r9MpcWgBeBQqYJnKeCUAH5ymcHg3K16SScNtolsBKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHqDYOz21RHR2kvzLoZHnsVhuq3eu00dvMgOcpeKXHbUbdB3mpeQdSw4Xjic007zolmeiRh85Mm5UE/K1bHPMqf9O3WJVtenl5dFRH13XCmysUui622OoWgbnof5Wzr1MkEn33xMci/b/JOQe9VpfAZXyogV10TYKUAPJtn6wfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqZaocfw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418B9C116B1;
	Sat, 15 Jun 2024 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718473722;
	bh=9r9MpcWgBeBQqYJnKeCUAH5ymcHg3K16SScNtolsBKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqZaocfwM6gODMYCE48MSWCdhQWvMEUhgF3dwnDLIwWbA5k42XuwnGKnlIZXDDKmi
	 Vadp/6x93hCSKEauJhjbOE1QKtzHyUeHSo6hWPD/yqPwkmumyQK/mn99o1wGrOoNlU
	 rBAQKwbkb7ui7muvXVYhqQTn9rBCvivqjtK6UGybfxCJPMKZUZf02RDe86MixbKiw2
	 SOss81PirOMxtdpxNlbkxRY935SNFGJDhpv+v1hHpLkoqU3hhhPzpXF53qKTF3R3bK
	 ygv6pTGykqU/FEvHHP1SUbJOp6e4SCQ0sHg8KiaeC4Le1n84PCBwmsknmLPaMi9DnL
	 NtOBUmzXDKMJQ==
Date: Sat, 15 Jun 2024 19:48:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] docs: i2c: summary: update I2C specification link
Message-ID: <ae2inii5eiswvbhfshvsupkfayonbuf7xwk2gsi7a5pccbsoxt@w7x3ynxlzlw6>
References: <20240614081239.7128-8-wsa+renesas@sang-engineering.com>
 <20240614081239.7128-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614081239.7128-10-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Fri, Jun 14, 2024 at 10:12:40AM GMT, Wolfram Sang wrote:
> Luckily, the specs are directly downloadable again, so update the link.
> Also update its title to the original name "I²C".
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

