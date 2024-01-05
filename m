Return-Path: <linux-i2c+bounces-1161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB3825A0C
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 19:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B21B71C20F18
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 18:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDF835281;
	Fri,  5 Jan 2024 18:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fN4v86Nq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFBC35883;
	Fri,  5 Jan 2024 18:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A22FC433C8;
	Fri,  5 Jan 2024 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704479166;
	bh=f7VSFskAiKi/g6N3WnJg4Cx6CGlztW/y+dSDep+fyXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fN4v86NqoM8FOp+YufE6gXnzRH1iOWmHTn+arIP4o0Of6RpqFCm1MqtcznKzow+p7
	 wLr21szFQl7s3q0cVWMa4tjDTt5DKIwdNkWWe5qQGnurKWpadiW6R816iQPRuQUuiN
	 o4s0BnZ0Zo8S97IPctKkctGgx7OOKGRaicR0XwdIXX/VmGSZ75IBsepfbmRqY+n/tx
	 SQV2QHm81Vm0K/tnemtGv/pvJvQSssrbaaYFUKfzidLoBV/CIWa9IWG91un6kwaH/h
	 OmDQTdUgQgF1/+hXIjHuGxfjtE0eniIHPakeBl5bDHBDxDsaFs0nTtiZtOodxJfKRx
	 nXl6E1FpSe+Ww==
Received: by pali.im (Postfix)
	id 5B117A52; Fri,  5 Jan 2024 19:26:03 +0100 (CET)
Date: Fri, 5 Jan 2024 19:26:03 +0100
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
Message-ID: <20240105182603.2bpvszkl7u7n4xyj@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-4-hdegoede@redhat.com>
 <20231224215502.dq6a2sq2hdfrpwof@pali>
 <a37ddb76-c93e-4422-80eb-11dae0985093@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a37ddb76-c93e-4422-80eb-11dae0985093@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 05 January 2024 17:31:32 Hans de Goede wrote:
> Hi Pali,
> 
> On 12/24/23 22:55, Pali Rohár wrote:
> > On Sunday 24 December 2023 22:36:19 Hans de Goede wrote:
> >> +static int smo8800_find_i801(struct device *dev, void *data)
> >> +{
> >> +	static const u16 i801_idf_pci_device_ids[] = {
> >> +		0x1d70, /* Patsburg (PCH) */
> >> +		0x1d71, /* Patsburg (PCH) */
> >> +		0x1d72, /* Patsburg (PCH) */
> >> +		0x8d7d, /* Wellsburg (PCH) */
> >> +		0x8d7e, /* Wellsburg (PCH) */
> >> +		0x8d7f, /* Wellsburg (PCH) */
> >> +	};
> > 
> > I'm not happy with seeing another hardcoded list of device ids in the
> > driver. Are not we able to find compatible i801 adapter without need to
> > hardcode this list there in smo driver?
> 
> I agree that having this hardcoded is not ideal.
> 
> The problem is that for a couple of generations (Patsburg is for
> Sandy Bridge and Ivybridge and Wellsburg is for Haswell and Broadwell)
> intel had multiple i2c-i801 controllers / I2C-busses in the PCH
> and the i2c_client needs to be instantiated on the primary
> i2c-i801 (compatible) controller.
> 
> Luckily Intel has only done this for these 2 generations PCH
> all older and newer PCHs only have 1 i2c-i801 I2C bus.
> 
> So even though having this hardcoded is not ideal,
> the list should never change since it is only for
> this 2 somewhat old PCH generations and new generations
> are not impacted. So I believe that this is the best
> solution.

I see. Seems that this is the best solution which we have.

Anyway, is not possible to use pci_dev_driver() to find i801 driver and
from it takes that list of devices which have FEATURE_IDF flag? I have
looked at the code only quickly and maybe it could be possible. Just an
idea.

> Regards,
> 
> Hans
> 
> 
> 
> 	
> 
> > And if really not, what about
> > sharing (or exporting) list from the i801 driver?
> > 
> > I'm just worried that this PCI id list will increase in the future and
> > it would be required to add a new and new id into it...
> > 
> >> +	struct i2c_adapter *adap, **adap_ret = data;
> >> +	struct pci_dev *pdev;
> >> +	int i;
> >> +
> >> +	adap = i2c_verify_adapter(dev);
> >> +	if (!adap)
> >> +		return 0;
> >> +
> >> +	if (!strstarts(adap->name, "SMBus I801 adapter"))
> >> +		return 0;
> >> +
> >> +	/* The parent of an I801 adapter is always a PCI device */
> >> +	pdev = to_pci_dev(adap->dev.parent);
> >> +	for (i = 0; i < ARRAY_SIZE(i801_idf_pci_device_ids); i++) {
> >> +		if (pdev->device == i801_idf_pci_device_ids[i])
> >> +			return 0; /* Only register client on main SMBus channel */
> >> +	}
> >> +
> >> +	*adap_ret = i2c_get_adapter(adap->nr);
> >> +	return 1;
> >> +}
> > 
> 

