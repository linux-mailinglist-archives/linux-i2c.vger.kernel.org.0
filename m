Return-Path: <linux-i2c+bounces-10948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC7AB4804
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 01:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EE5A7A7786
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 23:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46461268FEB;
	Mon, 12 May 2025 23:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVNQ2vAj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ADF268FD9;
	Mon, 12 May 2025 23:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747093332; cv=none; b=tGdo5wdHVVOtLKe2/eQEUMlEvAn4cEOh2nGtd1RM6K+Brn1lnSIhk0YwyG/B9INFGa1TP5otGTL/kU9hzRsvAXxIrcSQa5Ud6CgaPn7aewcXm3HkKz7isT0IAcgbOI34a5QxFITOd0J7QmjdG7grfxlOTnKIcoSWVwFaXxjUgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747093332; c=relaxed/simple;
	bh=uB0Bc4rD+TwerQ3zQGH6pog9tQKgYejBcH2+E1XrBSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKybHo+cYBJ0d6yu06rzDQKTlTLqfHueF+tpzDTjBtjeRatbXJ97YmE+pfWaPDBUkSwB559pgqJerxSFnX8OWBOiA5df0I8KcjsHLCa5V7cwF+Yhe28QgKmCB6iYEB2ctjaOlNYOS6djsfEBYPTGVd8dcVPTuICq0VxAS2Rio1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVNQ2vAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8169C4CEEF;
	Mon, 12 May 2025 23:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747093331;
	bh=uB0Bc4rD+TwerQ3zQGH6pog9tQKgYejBcH2+E1XrBSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVNQ2vAjAv0FgF94fvYyc+GKqciyzuvouLYbrF9iY6tJFsMZcZYh5nhZfx3yPEZEF
	 vC3Lft79wehcZeSzTvNoHBq2hEQNZVoJmno2VrhU8QAS4/X0BFspUcy1d2U5ha9S33
	 2Niba2MDWTNX6KWOH82Jv2vZPm79tHimhEARt8lNULtqmc6rwV2e3y3rSLB3WJrb85
	 Q0idzqGWaXgL3afyjCkKbfi9Zq3UH5nUUE4VqMGL7MtQY+swKJ1KMwbcQw2yvLc6oQ
	 5RAj/bretvBHjO0M7axfqss2SeLgnks7teCSI7z7u4R72Icsq0vlAR6s18wuJQvIqL
	 MFH3DoDNQ/dhg==
Date: Tue, 13 May 2025 01:42:07 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	linux-i2c@vger.kernel.org, 
	prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: microchip-corei2c: add smbus support
Message-ID: <xgmyz5ztxcsy2jzo7dh6rw5gvzvngbjuj7o6kpcmyqmsqx5jzv@6aawywepqu3b>
References: <20250430-preview-dormitory-85191523283d@spud>
 <3421bf4a-afa1-4b4c-8421-bad7187d3d8e@quicinc.com>
 <7q4gdh3jcbnsptmdv6fywnwqta5nekof4wtut35apw5wphhkio@veeu4ogcm44h>
 <20250506-bunny-puma-996aafbf3f56@spud>
 <4xyehpobtsyj2k5xlhupq7x6z7es7bvzek4zsf4roramy5h7kn@duxhfxd4gxsq>
 <20250508-unrefined-outhouse-3ff09d1e46b5@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508-unrefined-outhouse-3ff09d1e46b5@spud>

Hi Conor,

> > (No need to resend—you can just reply to this mail with your
> > updated commit log.)
> 
> I was just about to do this, but noticed you picked the patch up
> already. Sorry for the delay there, I meant to do it yesterday but
> crashed out early. I'd just have changed it to
> "Add hardware support for the SMBUS commands smbus_quick, smbus_byte,
> smbus_byte_data, smbus_word_data and smbus_block_data, replacing the
> fallback to software emulation"
> or similar. If you fancy rebasing, maybe use that?

Done! Thanks for following up!

Andi

