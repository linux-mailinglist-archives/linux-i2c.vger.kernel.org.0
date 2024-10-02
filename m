Return-Path: <linux-i2c+bounces-7196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B50BE98E5DB
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 00:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4072FB229A6
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 22:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF681991B0;
	Wed,  2 Oct 2024 22:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba2RxyGr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ACC2F22;
	Wed,  2 Oct 2024 22:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727907205; cv=none; b=L8GCyV40eXxkVyxA2aSspCh+d5L7ui3yh6MgaLaDl0ObAHZineF8OQm4qw+0RCR1YDeFjArafu65lOHzCBYSsQWcVGP+3505LB0WvEYhT7Cgk6BKGGA1GqDF8Uz1MgcQf6Xd5bVJFzCQBlJ6xK1Nk7nZhYFfAtDwkybOf/zJctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727907205; c=relaxed/simple;
	bh=6ntRtAZ1hx9oCjY4OB7h3RfLujrFmKJa8oTxAV+Hg+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SG70EGQkiltsw274DJ7X/+MyMBck42GGzpMW5Kot16OusnXrq4V4TDCLvnTxQGLb1mB7jYtnYZNDjSLZZ4wIQvh28mUVHzP4MAmC/ROsAAM3PlYLMglpMYJlJp5oDipM6wN1pcURjodpXR2ROajYRFuYe9DJGSD7BA9vBi6gK/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba2RxyGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88254C4CEC2;
	Wed,  2 Oct 2024 22:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727907205;
	bh=6ntRtAZ1hx9oCjY4OB7h3RfLujrFmKJa8oTxAV+Hg+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ba2RxyGr+cKGE/cGgVZsAExlOK2wfdWoB2U/rTNNWJBJQ0L3OwX9ReVQ6g8ljOUyE
	 SIeKTbWoCvx726B2aDKrrLOqHOSD6df0Laeg4co8ZLTpXa2btF8V9tX4D5hITMVTuk
	 uuAfyqHdCpp067oCRJ0WNWk8JZbkblY2/M/a1/dK2PgcK8o0M0JT1AVWMpayG/HhZi
	 Y0DFS8GMrdQvSEiPP2sNn0e1nfQNmnpdHj9iIjZ8UU4R999tWOLgaNhUUlkfOE3bms
	 ALGcNq8OoPqBbiMdNHWhPcnrT6V4SVKgq3MHiGsmq1oktFbUVDssJZ0QQPnASIOKzs
	 2Ca+iktf2ev5w==
Date: Thu, 3 Oct 2024 00:13:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "hunter.yu" <hunter.yu@hj-micro.com>
Cc: andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com, 
	lenb@kernel.org, rafael@kernel.org, jsd@semihalf.com, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, andy.xu@hj-micro.com, peter.du@hj-micro.com
Subject: Re: [PATCH v2 1/2] ACPI: APD: Add clock frequency for HJMC01 I2C
 controller
Message-ID: <pmbvhdaz4qt57gxemuxoyb6xjrcmvusm2jzl5ps3o5ga52edo5@qabu6rcbdipp>
References: <20240926024026.2539-1-hunter.yu@hj-micro.com>
 <20240926024026.2539-2-hunter.yu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926024026.2539-2-hunter.yu@hj-micro.com>

On Thu, Sep 26, 2024 at 10:40:05AM GMT, hunter.yu wrote:
> I2C clock frequency for HJMC01 is 200M, define a new ACPI
> HID for it.
> 
> Signed-off-by: hunter.yu <hunter.yu@hj-micro.com>

Do you want your name to be hunter.yu or Hunter Yu? I prefer the
second and if you browse the git log, you can see that everyone
uses Name Surnmae.

Andi

