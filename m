Return-Path: <linux-i2c+bounces-5004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DECD1932FEE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 20:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8875A1F2329A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2024 18:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EB51A01A7;
	Tue, 16 Jul 2024 18:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmZthBvV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAC119E7FE;
	Tue, 16 Jul 2024 18:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721154442; cv=none; b=BB8/jbfQYh8vPK+4SXRYmjtRmRBMuDjusW02tHPberHxkb8sF/edJfUW2B7rTq7+ZXp2sRzyWGyef+oqbqEFGu3reWvYjNVNTznAWqeK9h0Ug8JB0xmdrWaXhbZ8MkzMhoHd+/1TmpjrB1KbJrOql7T1hUK/fhUD0JJX8cLANN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721154442; c=relaxed/simple;
	bh=HgCnXwBwnD2e7j3+8c0coY7FwdyNPqi48uVFDiVIk98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIBYbMA7wAFJDLxgzYqYoBA4hqT4cccOCdo+D+Ram5nM6nJvCIu0TafHMmrPbggQdELihaBEpG9sarAkB4O5jELnvKR42oUGkTijWj/82L4L/tPaHz3pyKg4blnd9lx5T+/LJABg0Ow6mLa+wCIpVG7ReHhF96Cg8bgc+qmqs7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmZthBvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216FCC116B1;
	Tue, 16 Jul 2024 18:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721154441;
	bh=HgCnXwBwnD2e7j3+8c0coY7FwdyNPqi48uVFDiVIk98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lmZthBvVLuYE/5MjDlCft5zQq5OQ5GhHUHlEJEKmc/otN5Xo9ZakZdrtZ43uOMtmX
	 +wLs+xW+hf/gNvRRziA+priIOdQ6WYPIGyD+a/Fd+UdcYrfyJ1zjOpe1Q2bQbvVwCx
	 UXdG1l4+qRv1WS7HDG2ocq5P1Xjb1+oC0UWRy13UMw8O+x4Y07+825qWi68QNkbTmT
	 WkzlFOGQU+nwRWdAhwJSajXXdxhx2QiyQubXzBkWFDm7iCeEIoPcqSkZOjBJ+4jsb5
	 P1jHmYbqoPQYkSJH70oPqQAiFr4ECFmfWlXMNAYXy7yXiSf9C/RDsvioodrQSr19Si
	 Rst0bdeaFneLw==
Date: Tue, 16 Jul 2024 20:27:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: smbus cleanups and SPD support for piix4
Message-ID: <sf4fm42uqvprx4ubvuuwso4f5wjjou6peeoae3lb3fykso5gqs@jbe6unx7egtg>
References: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709-piix4-spd-v3-0-9d1daa204983@weissschuh.net>

Hi Thomas,

On Tue, Jul 09, 2024 at 07:35:34PM GMT, Thomas Weiﬂschuh wrote:
> Patches 1 is a preparation patch.
> Patch 2 is the actual change to piix4.
> 
> Patch 1 drops the warning about muxed busses.
> I didn't feel that the warning only would warrant the additional
> complexity it introduces with multiple callers of i2c_register_spd().
> 
> If others feel different, maybe a more generic warning/info or a source
> code comment would suffice.
> 
> On a machine with 32 slots of which 16 are populated only the first 8
> slots are addressable, half of which are empty.
> Unfortunately I couldn't run a custom kernel for testing.
> But manually instantiating ee1004 devices worked as expected,
> so the proposed changes should also work.
> 
> Tested with spd5118 and two DIMMs.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

with the comment added, pushed to

i2c/i2c-host.

Thanks,
Andi

