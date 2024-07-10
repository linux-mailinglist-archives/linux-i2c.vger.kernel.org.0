Return-Path: <linux-i2c+bounces-4825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87D92CC81
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0D171F22A38
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CE6A7EF09;
	Wed, 10 Jul 2024 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBgzMHup"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0840B82485;
	Wed, 10 Jul 2024 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598884; cv=none; b=I0r6C6Vm1OGFh0jqFviXS+mg3jKLVaj0RMTtYmI7gahGDCT1vm3TeVomD/Uka4lXIAjBXRhPTNoGMWlEQaSeu/h4gmmO8UbQ+yKXyQUH10HVsDQZ9tUy9vSSpV1eKBBzfaGwGXu34zJjY2T39AucDWYKSDNza+mw/sEjuME+2SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598884; c=relaxed/simple;
	bh=HyORFOy+osmQQ0qUOwd/ac0tt+tTqrUtwxh19jszgKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcTAKyrYyNAX+hPpBYtC1I8GUQGEmfHMk94f7RiitvqqYDLm8Br6s363e+igJ5Z3hU/U/gUb++DQRvYF8+5hFoM58yEdMDC7Tq5LfQR2Xy2vnfLAE9pOiSzfoE6+WCJuMx3Njns2F9CGHQI2WXY9sGNSFuBzRAg3qqBuFIoWZfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBgzMHup; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEFCC32781;
	Wed, 10 Jul 2024 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598883;
	bh=HyORFOy+osmQQ0qUOwd/ac0tt+tTqrUtwxh19jszgKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBgzMHupV6+1UdZNksVSWBrNNYjiTrkQN3Cch/cVzmFR+K3DlMZIbZbD+HjADcIGk
	 CLYaAY1KpwS0sOWwBfE0WJSqMgPSJwnPIGO9LBqwl1SoNva5GGfY6nRemjvpn6sPtu
	 BbCzpMqevxSY+BOUpcUI4Xu/RQnrUoiIr7UgoJqq9EvwFxcAMSCdDbJhc/WLPE9lm7
	 hKeZ+guNsJb/ZcrdaD5WQUmn7a5ShCZreSH4bEYl4urtwxlDjXTUCL9VYhOiQR25KD
	 91ltxn3qdJZvSa2+hp9psa4s3DE92+yU2M1KVpTJxsgiFDIiwuuUFiyW2wYpnqFsna
	 RIGfMSoFbnUyQ==
Date: Wed, 10 Jul 2024 10:08:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Eddie James <eajames@linux.ibm.com>, 
	openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/60] i2c: fsi: reword according to newest
 specification
Message-ID: <ukgbryddbwhbztjt2kkc3r63u54hkgyr5nda7dkor6jstgwpcd@rc2hwmjmhyoo>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-16-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-16-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:15PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

