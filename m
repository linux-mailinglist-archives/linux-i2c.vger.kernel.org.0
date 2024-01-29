Return-Path: <linux-i2c+bounces-1520-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD70841722
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 00:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98629284422
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2809524C4;
	Mon, 29 Jan 2024 23:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BIDXXIbs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EA74F1F5
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jan 2024 23:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706572068; cv=none; b=M35Nry7v1a7AzPj5PSBBFeXAu8UqUXYIiAgfUwwhmUJnbIeMCVqL1Y8D6Z3ComwP1IBtsAxvPm2PNoD0S0aR9FgCPL0b72ewU1EAzwJU6a+HWd8V5His3uOawkoHiQDq6LEJCZfJdAVmpwMmwLY17oFj4uXKdAN4RgBSuk8kZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706572068; c=relaxed/simple;
	bh=9aTxith/Q22H+mPByDCY1ZneR/euhZivRxhWCpBtRbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+jUg8irpOaffs01+/d3V3GJESs5By6bSO40INg5UcfvaZ2IdmcDRxcOd2mIoDtsTSe4hDNCIGt7zHHSfRZkv3dzYblDdPKJwN2R7mHqHgTzPJKYL8aj/J1IM0pmUZ8grPHUnfqNx4Y5Y3jnfzDR09ZaEgvSWx8S2f3I3SqlCTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BIDXXIbs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1C1C433C7;
	Mon, 29 Jan 2024 23:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706572067;
	bh=9aTxith/Q22H+mPByDCY1ZneR/euhZivRxhWCpBtRbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BIDXXIbsBjKVm31w09KcyQpdpC3bPQIDP5ySLokiTqSBiLeS4qPMU3BJ66T9ehnN/
	 YlzVGnazGMzK1A0EzgoIDpwO+HY/oFG1VkcbNqf/kb7kZpIbiILllSDNdAa7epb3Fo
	 ux9OVvFs9aLT+Ahh0GuIV6+d7evW5hnSvcgH4vgkBZBnFZRFk4sDp+0/Kmf01KK+bQ
	 DkITCsTyhOkUCSelSjiRrc074QNd7iC2FvhDMvPYa0H8lZRWSEivynmnVrL3akDlCl
	 pICKmlZVv0vOjxa2y4kOmGxhKDWaeFW8aJ7wQXAGoVroCylLAJ8R3ImAvNGPlYWIx8
	 HcAfnqQ0tThvg==
Date: Tue, 30 Jan 2024 00:47:40 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 4/8] i2c: i801: Define FEATURES_ICH5 as an extension of
 FEATURES_ICH4
Message-ID: <d5vt5nl2jyiv5ks376fatniwqfaqssw2tljvsmmxuimtibiw6r@lxkxndfo3i75>
References: <0d6a1cdb-39a1-4fad-a6e4-48953619f33b@gmail.com>
 <dbd94462-fd24-46d0-9321-54b5f79aff42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbd94462-fd24-46d0-9321-54b5f79aff42@gmail.com>

Hi Heiner,

On Fri, Sep 22, 2023 at 09:36:45PM +0200, Heiner Kallweit wrote:
> This change simplifies the code a little and makes clearer that the
> ICH5 feature set is an extension of the ICH4 feature set.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

