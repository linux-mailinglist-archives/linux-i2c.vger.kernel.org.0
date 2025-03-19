Return-Path: <linux-i2c+bounces-9893-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B711EA68114
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 01:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D9863B0455
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 00:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F77B10FD;
	Wed, 19 Mar 2025 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPYCrG9+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA1E801;
	Wed, 19 Mar 2025 00:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742343071; cv=none; b=GhQJJwY9vVebeXkTlnKVEqGJ9IZLXBB3NzdKpxEL77VofcLikID/gMjjukuPcQK8ScaMlIDG85yEOSx1GEgsgXLSEr1sQO3ihIvay8H90lQI7tjYrT3PFziyaETg/H216Ov2ZvoAxPviDjNDhiiHmA9li1rmRYcWOXM3BJOZHts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742343071; c=relaxed/simple;
	bh=NwWvYf+87fvr0HGnTJtD5UTKsF2KLh7jlLoTi6ttuXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXQ+EEZEtJhLP2oepgxo/izBKOj7rcgQlY79wNeD0CCLFkXbJ23zfA7Fb6NApe0xFypuSw/Nm+0iRvBDQfZ1meQN9nxtgSBOHQnuiRwKsDc7E1KhK3hEqibQvma9r+we8GCpNIRzcgFZPViaxwL0jqOkczevB6Ljmw2FcpXhZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPYCrG9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6203C4CEDD;
	Wed, 19 Mar 2025 00:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742343071;
	bh=NwWvYf+87fvr0HGnTJtD5UTKsF2KLh7jlLoTi6ttuXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPYCrG9+rhU5FHYyNLlS6GmO0y7GbnaPsqz8jz/XHx7N+OjA1CzJ9tFJ3SxUMueOe
	 VJldqOSAExmSLBhK1SYgUO+xFf4NAYtjb/O45E6ph33wCwOj/Ruikb5H6OIImngNVy
	 neNGbOmqYYlZG2oN7wNFhmnl/vp+uq7ASS2fF53GYFv9Q6Dd6hI1u6YLGjT+rBed3A
	 FEe39JXPzxO/mkAdhCqxbSdBdsxgD2eNlmH1PwlYc1r8vKK3tBWx1t0mv2oYUj0EGw
	 F2WPkO6qMk35gbALFM7I/V83TMNMuMrbZIOHODT4IQ1PcAdbKgGiLNqBhVO45kY+qF
	 4o5aOVJDNhd/g==
Date: Wed, 19 Mar 2025 01:11:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v12 2/3] i2c: octeon: remove 10-bit addressing support
Message-ID: <uwrn74jtojiok2kyxcgw6rx6v3qgy4esajrqn7m3qj3lemdat6@g57v26fdwr2y>
References: <20250311023435.3962466-1-aryan.srivastava@alliedtelesis.co.nz>
 <20250311023435.3962466-3-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311023435.3962466-3-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

On Tue, Mar 11, 2025 at 03:34:33PM +1300, Aryan Srivastava wrote:
> The driver gives the illusion of 10-bit address support, but the upper
> 3 bits of the given address are always thrown away. Remove unnecessary
> considerations for 10 bit addressing and always complete 7 bit ops when
> using the hlc methods.

Can someone from Marvell comment here?

The datasheet I have isn't very clear on this part. Also, I'd
like to know if there's any product line that could be negatively
impacted by this patch.

Andi

