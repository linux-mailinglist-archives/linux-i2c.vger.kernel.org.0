Return-Path: <linux-i2c+bounces-13364-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B29B2BB4BE7
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 19:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 453634247A1
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 17:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01DD26CE26;
	Thu,  2 Oct 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElJN2F4X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C0257834
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759427355; cv=none; b=Js+1TrBp5p1++YxQB6HmRiKecbQCcS7bsnhaMC3ToVEkdRsC90yUNrKHh+R02k8rt1qU0i7GRYJs2sJXLiPhYOpQn9VkgdMcRt/gKsu/xp2bQvWEao9YRkQCyCVtx77iphrcmbqSAUSjvD+EkiZT+LmB1HPmGTyUpv8XYSFnTpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759427355; c=relaxed/simple;
	bh=KAWVoEhpx8M69cwxFHY9yn0jZg7lKxV/De95LE5goao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P169ymS+bLCJAdFiYV12AWIuI4S6OqW6XdVE1xUK/wvDUMWJMr+afjcoLmGKZdgA1WxxB1l6d31EikqvZVd2Do4Atu4R/jMEhpP3/4/ok8aoWAJRxo8VtTu7HOq8XX/HIZFoO4MrzBaywKli7vwSR/2anl9psmWlQ0PMestE1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElJN2F4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858A4C4CEF4;
	Thu,  2 Oct 2025 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759427355;
	bh=KAWVoEhpx8M69cwxFHY9yn0jZg7lKxV/De95LE5goao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ElJN2F4Xq9/ItD5nm8AsLwTydNZ/nufJGtbMbFnUrcElBAR+bLmv/+D8+fWYrubQT
	 d8lKoz0DEmWc4+zR+xMReWDd8fd8zdqJsl1zmrHLxE06aseLz8lAHfSjHGL3+kLs20
	 TzAmis3D7oTZcp5b9JRP6GACuF4ddowuS2/xEeZVxg4hiNIl0yhLociEtaRKQjFLNi
	 aunOzoP9pp7L4hNWXYlK0m0wDw6ZXYGH1XMo76Nmfy3qhXZ5Fumbw4DRriMgP5GHdr
	 mlWTOa5uLXi28UgwvC4qHhJFaNrTyPqB8/iikOgw4EEDT14BxqSOAReBQchKdJaZqF
	 GyhY+DI85EUDA==
Message-ID: <056ae17a-5351-4be7-a14e-9becf8ec404c@kernel.org>
Date: Thu, 2 Oct 2025 19:49:12 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: usbio: Add ACPI device-id for MTL-CVF devices
To: "Cepeda Lopez, Israel A" <israel.a.cepeda.lopez@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20251001212310.4813-1-hansg@kernel.org>
 <aN2j7Gg2fqHCbAHi@kekkonen.localdomain>
 <e6b6d0b3-06a9-4fd6-8dff-7bbe94c76744@kernel.org>
 <aN5DYZpX1TbF5aLm@kekkonen.localdomain>
 <a601dab0-0a9a-4e03-a2ea-e75653758b1c@kernel.org>
 <DS4PPF11A2D567239809FF8803DAC6E7704FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <DS4PPF11A2D567239809FF8803DAC6E7704FAE7A@DS4PPF11A2D5672.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Israel,

On 2-Oct-25 5:52 PM, Cepeda Lopez, Israel A wrote:
> Hi Hans,
> 
> LJCA and USBIO shouldn't be sharing HIDs.

Yes in practice we have shipping hardware that is sharing HIDs
and since this is hardware out there in the field there is
nothing we can do about this.

> What is the USB IO expander in that system (lsusb)?

Dell Precision 5490: 8086:0b63 usb-ljca device
  with INTC10D1, INTC10D2 and INTC10D3 ACPI children

Dell Latitude 7450: 2ac1:20c9 usbio device
  with INTC10D1 and INTC10D2 ACPI children

As I already mentioned earlier in this thread the shared HIDs are not
really a problem because we have the USB driver binding by USB VID:PID
first and only then the code looks for the ACPI HIDs for the GPIO/I2C/SPI
children so at this point we are already in LJCA resp. USBIO specific
code-paths.

Regards,

Hans




