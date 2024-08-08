Return-Path: <linux-i2c+bounces-5230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7494C774
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 01:48:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15AD128176D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 23:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E194915ECD2;
	Thu,  8 Aug 2024 23:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+NJd13P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA3315B14C
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 23:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723160922; cv=none; b=HZnYVjpEX11OMa4MP/sn/ypNFV09jGwLooZqEQi2SbG8nyJ3MIy61MNT+VVdpnBIfzU6fXiIvVpPcCPD2lT8NlD35UtuDiehvqQ8stAGa16a8iRPIk3Mm8uhRtKoHKDQl3bfmyCxLCOApm/SbgOJ69+LzEFDiOiy5Gta/8WrlHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723160922; c=relaxed/simple;
	bh=KwxYsrdIARK1a54EgWYztgdDY5idD2fnegh9cQhmOQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIPoDMY8uJs1A1j/CKnozhreSAmqwTuGUtgmFs8l1fskun8LlPj13M7LMKbB/gXX30V3v1bq01Dvxe+PELRDtlALsx57pNFwY8RbFgRvJgktE46IR+RLRcPb1wkYJWHg381vpxN3PkldtCqd8AUgnk5gDa9640bopTiXGsz78q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+NJd13P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CE5C32782;
	Thu,  8 Aug 2024 23:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723160922;
	bh=KwxYsrdIARK1a54EgWYztgdDY5idD2fnegh9cQhmOQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+NJd13P+K6Piy1004kES2jVJ3UQmJwKWyK+xctliIhuRDmZAgG8UkJvhTopRHk61
	 DfkG3Dz3WBTAU5gOAagG+2ERjDoZqGlNTE9z7kUCzJt+AaQ0hcWmO7Ul4wOR2gSKis
	 p+LquRbWV2zWpCIP2hVCqROV/oEfI3d9dk8nkrd3fjfh06yf2+pdo5wSJsS70AsNEH
	 j010w0ySx05sjWEpecCBZmRX5vUPun+o7Z4T20br3PkKDkbVxJvkW6puBZKuRMxvFM
	 sPpEFPhJasFGlkCrt0sjoAKlep+YJEg/m0lvCmYx3yivLWd1sV+np+z0YA2063Rkf8
	 4/a2UtfGztyAA==
Date: Fri, 9 Aug 2024 00:48:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-i2c@vger.kernel.org, Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH v4 1/1] i2c: keba: Add KEBA I2C controller support
Message-ID: <k2gzyskvkr3ra5qvkxmacpg56gfj26rbathfz72azvc4aiogdi@i6ljqtzsh4q5>
References: <20240731192551.94035-1-gerhard@engleder-embedded.com>
 <20240731192551.94035-2-gerhard@engleder-embedded.com>
 <o2tdjhjty2rcdx37a27h6nwftqrmwcltvyuf5m7x5nixa2y3su@nry7t4h7ozi3>
 <41887048-b534-4ad7-91fd-5e8afb76e554@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41887048-b534-4ad7-91fd-5e8afb76e554@engleder-embedded.com>

Hi Gerhard,

...

> > > +		unsigned short const addr_list[2] = { info[i].addr,
> > > +						      I2C_CLIENT_END };
> > > +
> > > +		client = i2c_new_scanned_device(&ki2c->adapter, &info[i],
> > > +						addr_list, NULL);
> > 
> > so this comes with a known client's list. Stupid question, have
> > you checked the address range is OK for this use?
> 
> Yes, the addresses are 0x4c (EMC1403) and 0x50 to 0x56 (EEPROMs).
> All between 0x08 and 0x77. All devices are working/found.

just making sure :-)

> > > +			ki2c_unregister_devices(ki2c);
> > 
> > ...
> > 
> > > +	/* reset bus before probing I2C devices */
> > > +	ret = ki2c_reset_bus(ki2c);
> > > +	if (ret)
> > > +		goto out;
> > 
> > We can still have the enabling and the reset at the end, I don't
> > seen any interaction with the hardware.
> 
> At least ki2c_register_device() does interact with the hardware. It uses
> i2c_new_scanned_device() which probes the devices.
> 
> IMHO the device shall be ready to operate when devm_i2c_add_adapter()
> is called. Because the user space can trigger I2C action as soon as
> devm_i2c_add_adapter() is done. So enabling and reset after
> devm_i2c_add_adapter() would be a potential race against user space I2C
> actions. Is that correct?

It's OK! Thanks.

Andi

