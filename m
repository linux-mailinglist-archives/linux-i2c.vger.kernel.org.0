Return-Path: <linux-i2c+bounces-1560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 488F28447C0
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 20:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6113281350
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 19:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B30374DE;
	Wed, 31 Jan 2024 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPQZLRAN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D92110B;
	Wed, 31 Jan 2024 19:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706727865; cv=none; b=llXk0FzHKu09Q+My1EQ26kMo2c7vwZrai1RT7YWl7le2jM50WSTn+Rv0WKae2QY6Zx0l+lXFs7k7fQOaTeVDdmIgrQMIU5F2Ny0ePovuMhCEpiYdGJvh45M/csoWm0D75QAjmFh8oIUQabPuaogemIz+4WmE911tPtmLzR7cKRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706727865; c=relaxed/simple;
	bh=ZFaDRFvyJi8lc9H2xeHHqn2J0lyfMDKKkZt/RaDQJyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjR05bm/OkPsGhT1Zlrs2zZWUnAfRDNMYKOYWElmz/SqpqM3qIPReQk2dp4IAddmrSufCdinU4DRSxnY4KlfMGelKBxOYOXqwanI+CK09v8LAAkKKjCB1mJr3UImaXTZ61f3IljOE/5bvI7witoOQthiPQ6vIO5MTIe8XPfDGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPQZLRAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4739CC433C7;
	Wed, 31 Jan 2024 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706727863;
	bh=ZFaDRFvyJi8lc9H2xeHHqn2J0lyfMDKKkZt/RaDQJyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPQZLRANymnanJEmVrcU1z5hwoMHQ0uiQ2OuD0i/eugGPZiRSQKYKEElVSkQjwfOm
	 AhyvdcTA/3byabyI6bqeTnoCEow1gajhWprTieKkGfmDN4xPtujfzzK5RDHXYViMK6
	 8XYYZvWVJp9jXvAeqnp++2o060/zCZyzHU5nXvzkNeg+NBAAWGfBQs44WlljopfwzJ
	 SYaUNOonI+e0L070SLPY9sVzL3lbT9tE8iHo/b1Tw0CvwdpbPcdiGo9I4ob4c1TQcQ
	 UfzSFeOUwFK7PHNzyZFsMrDISII7Xf0HyPYVqBK8J3GwNBkyAjg+U4YF4EHYNNkiW1
	 wpa3Xx+dtRPNA==
Date: Wed, 31 Jan 2024 13:04:21 -0600
From: Rob Herring <robh@kernel.org>
To: Charles Hsu <ythsu0511@gmail.com>
Cc: krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, naresh.solanki@9elements.com,
	peteryin.openbmc@gmail.com, patrick.rudolph@9elements.com,
	alexander.stein@ew.tq-group.com, lakshmiy@us.ibm.com,
	bhelgaas@google.com, michal.simek@amd.com, lukas@wunner.de,
	festevam@denx.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
	ytshu0511@gmail.com
Subject: Re: [PATCH v2] hwmon: Add driver for MPS MPQ8785 Synchronous
 Step-Down Converter
Message-ID: <20240131190421.GA2119523-robh@kernel.org>
References: <20240129083115.2107466-1-ythsu0511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129083115.2107466-1-ythsu0511@gmail.com>

On Mon, Jan 29, 2024 at 04:31:15PM +0800, Charles Hsu wrote:
> Add support for mpq8785 device from Monolithic Power Systems, Inc.
> (MPS) vendor. This is synchronous step-down controller.
> 
> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
> 
> ---
> Change in v1:
>     Initial patchset.
> Change in v2:
>     1.Add pmbus support status registers.
>     2.Add mpq8785 in trivial-devices.yaml.
>     3.Remove format[PSC_VOLTAGE_OUT]
>     4.Fix MODULE_DESCRIPTION
> ---
>  .../devicetree/bindings/trivial-devices.yaml  |  2 +

Bindings are a separate patch. checkpatch.pl will tell you this.

>  Documentation/hwmon/index.rst                 |  1 +
>  Documentation/hwmon/mpq8785.rst               | 94 +++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig                   |  9 ++
>  drivers/hwmon/pmbus/Makefile                  |  1 +
>  drivers/hwmon/pmbus/mpq8785.c                 | 62 ++++++++++++
>  6 files changed, 169 insertions(+)
>  create mode 100644 Documentation/hwmon/mpq8785.rst
>  create mode 100644 drivers/hwmon/pmbus/mpq8785.c

