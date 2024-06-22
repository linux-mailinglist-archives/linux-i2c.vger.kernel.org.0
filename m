Return-Path: <linux-i2c+bounces-4258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B22A39134AD
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 17:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6BCFB2426E
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D2E172BBE;
	Sat, 22 Jun 2024 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzOPf/+P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26F4172790;
	Sat, 22 Jun 2024 15:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719068859; cv=none; b=fDl9yqiPFT8IGsxzdD0oeh4CIx4Kmoq7p1v9JP2JQ761nQ4w1TymyqR4tIDaXPD/k+nxh1z2hbjDTfNL4HGG94Q6FnunGUNTamqnIigq8lv/qck1xtC7jyonpC/MuFoMhD21oCxkZ/YH5OGuqlnRCJu2AJbRh6ilCAFiLeIr+gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719068859; c=relaxed/simple;
	bh=bN147Cg0you8yxyWpwUUiR0imF1t5AeTup/N2p5qLKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jjx++6PNjoCBoTGGypKJwXGsh44pHb8F3n+NKsYsahtlwYx0u6Alwn0AoQ4CuB4pso7d0jU0BUAdy8gHUwVRnb98zYlGffLK/nrTyNL/w4AXbSKKUy02JkSlBhEWQAHMSYGuuBN/mPQD4TZMAd5xjqkyTSW14AE0dDKShrJoROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzOPf/+P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7F6C32789;
	Sat, 22 Jun 2024 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719068859;
	bh=bN147Cg0you8yxyWpwUUiR0imF1t5AeTup/N2p5qLKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BzOPf/+PVSwUBe9JQWPRjQJTeNrm1/5RzWvajBmVIRAal/K25Tl+tWqRkJRuh4VEo
	 Bmn5udZ7CZ+yJrb3oxE0NOABh8gqTzsLnm+M3ifXBGw07pB03rFHJ3nS+9GVlgdh0b
	 6uhEMY3w1flge0nlB9ZrvtRHK/JkeLRDU8k0dwZIfC82AR9I4sY1fFON/ajanTV703
	 EoMs506vM9n+tTdUAvNjFpYfzM5JQqxLWm/O6I6xBTRzEfbngJMjX+bffJKxj73mSY
	 ISbqrzOg0lmE0EAQmVmH8AR3e+eziJ9iCc68qLptKakC8dNoVyVQjrw93n9VhavNu8
	 t8Q1jRIdAvSQQ==
Received: by pali.im (Postfix)
	id C45CCBF5; Sat, 22 Jun 2024 17:07:35 +0200 (CEST)
Date: Sat, 22 Jun 2024 17:07:35 +0200
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
Message-ID: <20240622150735.ndw23oqabsnnmn2z@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-3-hdegoede@redhat.com>
 <20240622124644.hndwwp44sfbiiq7o@pali>
 <8c45cc19-2164-46ea-a388-de23885c3323@redhat.com>
 <20240622140840.n5733l4ere26gnra@pali>
 <9736d178-ae8b-4e70-9b9f-7933d285f74c@redhat.com>
 <20240622142324.eocv3iv2tkxeig2c@pali>
 <00d0d92c-322c-4970-9fc3-986f308a93b1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00d0d92c-322c-4970-9fc3-986f308a93b1@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 22 June 2024 16:29:21 Hans de Goede wrote:
> Hi,
> 
> On 6/22/24 4:23 PM, Pali Rohár wrote:
> > On Saturday 22 June 2024 16:14:11 Hans de Goede wrote:
> >> Hi Pali,
> >>
> >> On 6/22/24 4:08 PM, Pali Rohár wrote:
> >>> On Saturday 22 June 2024 15:56:03 Hans de Goede wrote:
> >>>> Hi,
> >>>>
> >>>> On 6/22/24 2:46 PM, Pali Rohár wrote:
> >>>>> On Friday 21 June 2024 14:24:57 Hans de Goede wrote:
> >>>>>> On chipsets with a second 'Integrated Device Function' SMBus controller use
> >>>>>> a different adapter-name for the second IDF adapter.
> >>>>>>
> >>>>>> This allows platform glue code which is looking for the primary i801
> >>>>>> adapter to manually instantiate i2c_clients on to differentiate
> >>>>>> between the 2.
> >>>>>>
> >>>>>> This allows such code to find the primary i801 adapter by name, without
> >>>>>> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
> >>>>>>
> >>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>>>> ---
> >>>>>>  drivers/i2c/busses/i2c-i801.c | 9 +++++++--
> >>>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> >>>>>> index d2d2a6dbe29f..5ac5bbd60d45 100644
> >>>>>> --- a/drivers/i2c/busses/i2c-i801.c
> >>>>>> +++ b/drivers/i2c/busses/i2c-i801.c
> >>>>>> @@ -1760,8 +1760,13 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >>>>>>  
> >>>>>>  	i801_add_tco(priv);
> >>>>>>  
> >>>>>> -	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> >>>>>> -		"SMBus I801 adapter at %04lx", priv->smba);
> >>>>>> +	if (priv->features & FEATURE_IDF)
> >>>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> >>>>>> +			"SMBus I801 IDF adapter at %04lx", priv->smba);
> >>>>>> +	else
> >>>>>> +		snprintf(priv->adapter.name, sizeof(priv->adapter.name),
> >>>>>> +			"SMBus I801 adapter at %04lx", priv->smba);
> >>>>>> +
> >>>>>
> >>>>> User visible name is identifier for user / human.
> >>>>>
> >>>>> If somebody is going to read this code in next 10 years then can ask
> >>>>> question why to have different name for IDF FEATURE and not also for
> >>>>> other features? And can come to conclusion to unify all names to be
> >>>>> same (why not? it is user identifier).
> >>>>
> >>>> That is a good point, I'll add a comment about this for the next
> >>>> version.
> >>>>
> >>>>> Depending on user names between different kernel subsystem is fragile,
> >>>>> specially for future as rename can happen.
> >>>>
> >>>> Relying no devices names to find devices is standard practice. E.g.
> >>>> this is how 99% of the platform drivers bind to platform devices
> >>>> by the driver and the device having the same name.
> >>>
> >>> But here it is adapter name which is more likely description, not the
> >>> device name which is used for binding.
> >>
> >> It is still matching on a name.
> >>
> >>>>> If you are depending on FEATURE_IDF flag then check for the flag
> >>>>> directly, and not hiding the flag by serializing it into the user
> >>>>> visible name (char[] variable) and then de-serializing it in different
> >>>>> kernel subsystem. If the flag is not exported yet then export it via
> >>>>> some function or other API.
> >>>>
> >>>> Exporting this through some new function is non trivial and adds
> >>>> extra dependencies between modules, causing issues when one is builtin
> >>>> and the other is build as a module.
> >>>
> >>> Access to "struct i801_priv *" is not possible? For example via
> >>> dev_get_drvdata() on "struct device *" which you have in
> >>> smo8800_find_i801()?
> >>>
> >>> Because if it is possible then you can create an inline function in some
> >>> shared header file which access this flag. Not perfect (as accessing
> >>> private data is not the best thing) but can avoid dependences between
> >>> modules.
> >>
> >> Prodding inside another drivers private driver struct is a big nono
> >> and much much more fragile then the name checking.
> > 
> > I know, that is why I wrote to access this structure and flags in
> > separate function which can be an inline in e.g. i2c-i801.h header file.
> 
> We would still need to be very very sure the device we are calling that
> function on actually has the i2c-i801.c driver bound to it, so that
> e.g. we are not dereferencing a NULL pointer drvdata, or worse
> poking at some other drivers private data because we are calling
> the helper on the wrong device.
> 
> To make sure that is the case we would need to e.g. check that:
> a) The device in question is an i2c adapter
> b) the adapter name matches, so we would still be doing name matching ...
> 
> Really just matching on the adapter name is by far the cleanest
> option here.
> 
> Regards,
> 
> Hans

Ok, I have looked at it now.

For a) you are already using i2c_verify_adapter(). So this part is done.

For b) you do not need to check adapter name, but rather adapter driver
name (in case driver data are begin accessed). And I think you can use
dev->driver.name to get it.

Anyway, I see that pattern "to_<something>_driver" is commonly used.

