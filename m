Return-Path: <linux-i2c+bounces-1171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB13825F6F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 13:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DBFF91F23279
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 12:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A612E6FC9;
	Sat,  6 Jan 2024 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsJWQq87"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA046FAE;
	Sat,  6 Jan 2024 12:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B350C433C8;
	Sat,  6 Jan 2024 12:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704543408;
	bh=HybGMDQq3v2XjGRGZU36KQebR8y0K0uE5cQ/WhHgI/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsJWQq87EzuGFADup9GgvI2qaPLfByfXQqo4Ufseko1OKYbdOAx+3048dRdP+6l1l
	 mJwJOaDaOwKg6XHfUHWAaaMoDRiBuo0ApPSOZTbsixHnT4a3zscCFXiR+0gmclpcgZ
	 1+x2Bjm4RkfTwm+PZ/iYrCEIhsCjbubirMrtUEtqWPwkq/IROYWlrd3x2HS9QBZbnf
	 qWTINrr4yPh6sp+fS9o111tNQ+zp7+c2l3xhidNY2LPQzvBKnRaPCXiV5ff0QymdKh
	 g46lOfGJ4piRiKarhfgBuUS/VCx8IQTwp94meBYtEVFFeJh/RNeXUGxLX8Wc3HiMIj
	 3CsNcSyiV0M5w==
Received: by pali.im (Postfix)
	id CB73C88D; Sat,  6 Jan 2024 13:16:44 +0100 (CET)
Date: Sat, 6 Jan 2024 13:16:44 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240106121644.eohsme67ikqkdyzu@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-4-hdegoede@redhat.com>
 <20231224215502.dq6a2sq2hdfrpwof@pali>
 <a37ddb76-c93e-4422-80eb-11dae0985093@redhat.com>
 <20240105182603.2bpvszkl7u7n4xyj@pali>
 <821bfe95-8ace-4f6d-acdc-5771cb72b276@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <821bfe95-8ace-4f6d-acdc-5771cb72b276@redhat.com>
User-Agent: NeoMutt/20180716

On Saturday 06 January 2024 13:13:01 Hans de Goede wrote:
> Hi,
> 
> On 1/5/24 19:26, Pali Rohár wrote:
> > On Friday 05 January 2024 17:31:32 Hans de Goede wrote:
> >> Hi Pali,
> >>
> >> On 12/24/23 22:55, Pali Rohár wrote:
> >>> On Sunday 24 December 2023 22:36:19 Hans de Goede wrote:
> >>>> +static int smo8800_find_i801(struct device *dev, void *data)
> >>>> +{
> >>>> +	static const u16 i801_idf_pci_device_ids[] = {
> >>>> +		0x1d70, /* Patsburg (PCH) */
> >>>> +		0x1d71, /* Patsburg (PCH) */
> >>>> +		0x1d72, /* Patsburg (PCH) */
> >>>> +		0x8d7d, /* Wellsburg (PCH) */
> >>>> +		0x8d7e, /* Wellsburg (PCH) */
> >>>> +		0x8d7f, /* Wellsburg (PCH) */
> >>>> +	};
> >>>
> >>> I'm not happy with seeing another hardcoded list of device ids in the
> >>> driver. Are not we able to find compatible i801 adapter without need to
> >>> hardcode this list there in smo driver?
> >>
> >> I agree that having this hardcoded is not ideal.
> >>
> >> The problem is that for a couple of generations (Patsburg is for
> >> Sandy Bridge and Ivybridge and Wellsburg is for Haswell and Broadwell)
> >> intel had multiple i2c-i801 controllers / I2C-busses in the PCH
> >> and the i2c_client needs to be instantiated on the primary
> >> i2c-i801 (compatible) controller.
> >>
> >> Luckily Intel has only done this for these 2 generations PCH
> >> all older and newer PCHs only have 1 i2c-i801 I2C bus.
> >>
> >> So even though having this hardcoded is not ideal,
> >> the list should never change since it is only for
> >> this 2 somewhat old PCH generations and new generations
> >> are not impacted. So I believe that this is the best
> >> solution.
> > 
> > I see. Seems that this is the best solution which we have.
> > 
> > Anyway, is not possible to use pci_dev_driver() to find i801 driver and
> > from it takes that list of devices which have FEATURE_IDF flag? I have
> > looked at the code only quickly and maybe it could be possible. Just an
> > idea.
> 
> That is an interesting idea, but ...
> 
> that would mean interpreting the driver_data set by the i2c-i801
> driver inside the dell-smo8800 code, so this would basically rely on
> the meaning of that driver_data never changing. I would rather just
> duplicate the 6 PCI ids and decouple the 2 drivers.

It was just an alternative idea.

In case of code duplication I would suggest to write a comment on both
places (into i801 and smo drivers) that this information is duplicated
in both drivers and should be synchronized in case somebody would need
to modify it at either place.

> Regards,
> 
> Hans
> 
> 
> 
> 
> >>>> +	struct i2c_adapter *adap, **adap_ret = data;
> >>>> +	struct pci_dev *pdev;
> >>>> +	int i;
> >>>> +
> >>>> +	adap = i2c_verify_adapter(dev);
> >>>> +	if (!adap)
> >>>> +		return 0;
> >>>> +
> >>>> +	if (!strstarts(adap->name, "SMBus I801 adapter"))
> >>>> +		return 0;
> >>>> +
> >>>> +	/* The parent of an I801 adapter is always a PCI device */
> >>>> +	pdev = to_pci_dev(adap->dev.parent);
> >>>> +	for (i = 0; i < ARRAY_SIZE(i801_idf_pci_device_ids); i++) {
> >>>> +		if (pdev->device == i801_idf_pci_device_ids[i])
> >>>> +			return 0; /* Only register client on main SMBus channel */
> >>>> +	}
> >>>> +
> >>>> +	*adap_ret = i2c_get_adapter(adap->nr);
> >>>> +	return 1;
> >>>> +}
> >>>
> >>
> > 
> 

