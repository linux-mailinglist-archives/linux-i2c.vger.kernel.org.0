Return-Path: <linux-i2c+bounces-1517-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F098416E6
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5511C1C22654
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B17A51C5D;
	Mon, 29 Jan 2024 23:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOsvvx3V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07D651C31
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706571185; cv=none; b=tKwsCyO13wCsOdXE3VPZi/oKtmTMfazwpL9L5CAyuCOwjIvTpGTQKN4bjKQy+F+lvOL0t13lSpbq+3GCjpjO0Bkku2ZKsrDpSfyuxbcHdiPj+HdUse0G45BYjIpewad2pUN8eRM7MGSotO0TUVYZ7uhNHzXr0mXNVBYtYkShpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706571185; c=relaxed/simple;
	bh=lUTPNxaU6CoP6Ha4JNR6FJmk+THZafZkZ7sfRUU+lWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owOY/OS1XdJCBCMectGX5OrEvxQg46gKa3OlD56Q5sjgSJ4fd7Q0RSc1CxGdxOwlZg99lUYGnQpDaW3mhvOW5VAbeFDEd+e0OJ2jTSAgje1tg9a59FS0inlnTV2LHO0Dk4548HkRAwSeOsy6mSBlUsOSl8DCBevRVVxWADnUL8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOsvvx3V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E411C433C7;
	Mon, 29 Jan 2024 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706571184;
	bh=lUTPNxaU6CoP6Ha4JNR6FJmk+THZafZkZ7sfRUU+lWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOsvvx3VOAlqTif5tTSAv9viS3JxyMHOg52vLIRUUJ7Cat9HZlasAmWAAFDe7tr9Z
	 nIVeXMJuyo8zME+x1CJkmrg28QeuQI1A+UMQC1Es444RdtwiTq8epBal33RlRgQ5wS
	 PNFD2BVdhm0lobjE9cOxiRasijdtTn1hSs0sRdrdRsxuF4E+RcgbS7IvrRp+rXUWA3
	 7kYFXWfc9JkwEMQDIKRBbWcckd0fuNuvFZHprArPBn+EI9duIJmIDAJwLJuec9UyWX
	 M+NzCl/kOQZXXhkrxcDhfsPjbRCINeJcaA0+mNbLWUIq3ugAi7x//gfzp0C0b8V9yR
	 roxCKPG/b7ZBA==
Date: Tue, 30 Jan 2024 00:32:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/8] i2c: i801: Replace magic value with constant in
 dmi_check_onboard_devices
Message-ID: <42giehjkmpij4xmayzw6cseb46znu65574i74tyghdvytge5dj@3k25knejh5kz>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <71286ba3-27cb-41cb-bb38-2c4e6d2a49f1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71286ba3-27cb-41cb-bb38-2c4e6d2a49f1@gmail.com>

Hi Heiner,

On Fri, Sep 22, 2023 at 09:34:13PM +0200, Heiner Kallweit wrote:
> Replace magic number 10 with the appropriate constant.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

