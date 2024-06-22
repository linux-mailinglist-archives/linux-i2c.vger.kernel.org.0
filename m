Return-Path: <linux-i2c+bounces-4254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A4091346D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 16:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A9DE1F2266D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 14:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B21916F82E;
	Sat, 22 Jun 2024 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKOwHnBj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4496014B965;
	Sat, 22 Jun 2024 14:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719066208; cv=none; b=apWiESOn4JdBDVYvpGNolEJQL+hjWunn3NGD0Qn5K3JBKKt78T6Pya5Bc0PNaHPlW/IMaKkNAvzVkFx/eEfLE3p/sCkRHuqEcT+4i2xfMauzcHfW74bqDeyxURDwQAmxKqT25IAEIlgQ+1Nd2AWEaLWlKeKafxLWOwkTO9JG5b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719066208; c=relaxed/simple;
	bh=HuCIOk+h3mK4PW2KP2sXGEDMU9RhK58+RDYWMFu2e4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeozpG1AndTChQgNdyJp4LH3noNqkLYlelZEpgzX8pqSVx73Iuw+cA3M9+dpoIx6BiQMbvRfuHaqbLdkjxi9H+9bsTh9UmWQMBPWGMrW13fm9IUny7DRFj31RwDoQ6pCN6+iOq1q7ihNgMa4ZTL5MR7BZFk1G6oFc1ZXgleenz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKOwHnBj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7248DC3277B;
	Sat, 22 Jun 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719066207;
	bh=HuCIOk+h3mK4PW2KP2sXGEDMU9RhK58+RDYWMFu2e4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JKOwHnBj8RmBKx6o3qG8meGqotnHnZo04ik0Gv1/7iWwpqLTDySE7oTqC1DLB1vlr
	 L2Qoy9Rk0acWGGuCPPztZZM2xNGAJh9634G0DJn9M31fXaWkHjDNwenCEEZdGOHJF5
	 bOs1X1ZFYipFiJ0nBTh5wCGufZy+1d+sz6kFwJIJPuZWN+kYXMh+rmDC0GoNyrhe5X
	 MpxUA9BIRrtaTLFb4ms+W7c2ldlQ/xluYUWGAHbGk7oO4TnI6I5WeOmcN0Tonomwsb
	 BtkonSc9IXyNTu6aGmvXKud7XaYxmKRqnrHYDk1JInCNuDHoAgZ6sqHTMnuZRcZZ4J
	 knHkxM4NNqL2g==
Received: by pali.im (Postfix)
	id 77536BF5; Sat, 22 Jun 2024 16:23:24 +0200 (CEST)
Date: Sat, 22 Jun 2024 16:23:24 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <20240622142324.eocv3iv2tkxeig2c@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-3-hdegoede@redhat.com>
 <20240622124644.hndwwp44sfbiiq7o@pali>
 <8c45cc19-2164-46ea-a388-de23885c3323@redhat.com>
 <20240622140840.n5733l4ere26gnra@pali>
 <9736d178-ae8b-4e70-9b9f-7933d285f74c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9736d178-ae8b-4e70-9b9f-7933d285f74c@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 22 June 2024 16:14:11 Hans de Goede wrote:
> Hi Pali,
> 
> On 6/22/24 4:08 PM, Pali Rohár wrote:
> > On Saturday 22 June 2024 15:56:03 Hans de Goede wrote:
> >> Hi,
> >>
> >> On 6/22/24 2:46 PM, Pali Rohár wrote:
> >>> On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
> >>>> On chipsets with a second 'Integrated Device Function' SMBus controller use
> >>>> a different adapter-name for the second IDF adapter.
> >>>>
> >>>> This allows platform glue code which is looking for the primary i801
> >>>> adapter to manually instantiate i2c_clients on to differentiate
> >>>> between the 2.
> >>>>
> >>>> This allows such code to find the primary i801 adapter by name, without
> >>>> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
> >>>>
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>> ---
> >>>>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
> >>>>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >>>> index d2d2a6dbe29f..5ac5bbd60d45 100644
> >>>> --- a/drivers/i2c/busses/i2c-i801.c
> >>>> +++ b/drivers/i2c/busses/i2c-i801.c
> >>>> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >>>>  
> >>>>  	i801_add_tco(priv);
> >>>>  
> >>>> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> >>>> -		"SMBus I801 adapter at %04lx", priv->smba);
> >>>> +	if (priv->features & FEATURE_IDF)
> >>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> >>>> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
> >>>> +	else
> >>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> >>>> +			"SMBus I801 adapter at %04lx", priv->smba);
> >>>> +
> >>>
> >>> User visible name is identifier for user / human.
> >>>
> >>> If somebody is going to read this code in next 10 years then can ask
> >>> question why to have different name for IDF FEATURE and not also for
> >>> other features? And can come to conclusion to unify all names to be
> >>> same (why not? it is user identifier).
> >>
> >> That is a good point, I'll add a comment about this for the next
> >> version.
> >>
> >>> Depending on user names between different kernel subsystem is fragile,
> >>> specially for future as rename can happen.
> >>
> >> Relying no devices names to find devices is standard practice. E.g.
> >> this is how 99% of the platform drivers bind to platform devices
> >> by the driver and the device having the same name.
> > 
> > But here it is adapter name which is more likely description, not the
> > device name which is used for binding.
> 
> It is still matching on a name.
> 
> >>> If you are depending on FEATURE_IDF flag then check for the flag
> >>> directly, and not hiding the flag by serializing it into the user
> >>> visible name (char[] variable) and then de-serializing it in different
> >>> kernel subsystem. If the flag is not exported yet then export it via
> >>> some function or other API.
> >>
> >> Exporting this through some new function is non trivial and adds
> >> extra dependencies between modules, causing issues when one is builtin
> >> and the other is build as a module.
> > 
> > Access to "struct i801_priv *" is not possible? For example via
> > dev_get_drvdata() on "struct device *" which you have in
> > smo8800_find_i801()?
> > 
> > Because if it is possible then you can create an inline function in some
> > shared header file which access this flag. Not perfect (as accessing
> > private data is not the best thing) but can avoid dependences between
> > modules.
> 
> Prodding inside another drivers private driver struct is a big nono
> and much much more fragile then the name checking.

I know, that is why I wrote to access this structure and flags in
separate function which can be an inline in e.g. i2c-i801.h header file.

> Regards,
> 
> Hans
> 
> 

