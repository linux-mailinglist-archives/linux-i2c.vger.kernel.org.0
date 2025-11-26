Return-Path: <linux-i2c+bounces-14296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E64C8BAF1
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 20:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1DE3BB1BE
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Nov 2025 19:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4B333FE33;
	Wed, 26 Nov 2025 19:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="KgU5fiq/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0046e701.pphosted.com (mx0b-0046e701.pphosted.com [67.231.157.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC81B33A03D;
	Wed, 26 Nov 2025 19:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764185909; cv=none; b=D1HI85phMAil0xyqJwxZKXYDhNpDOvZUZWmXJQmVCfy+e7HWpcI30r8Qd831wGSt3DU+fQL0z6RljuTsoBAO9pFL5IRvJOxsQ4xo7VwGyxigda0+RxNsEE96kjJTFFZyoMwJ1gLElssIdk+Wh5REDZ/+Iul9kjqHLD8T6XQc7q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764185909; c=relaxed/simple;
	bh=IEtOKsZRpLysAHTIApvSDXdfcL1K/qKLHCMUtnTh9lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWEC7cWq5Yv+8tfL7juymLYn3r9Q8EU9XnNcHwWz8W66WvL5OjYexnFRALQ7YpcEqrJgfF1Ex3EU8HXJbmsiJympU7SdO2KkUA/Pdyqu9JvN73oD4SGA4MG47tqENNtDt2ryr85b1SDlL5Ze/kyMi3ssVylHufcQktijwzO7AOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=KgU5fiq/; arc=none smtp.client-ip=67.231.157.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0425992.ppops.net [127.0.0.1])
	by mx0b-0046e701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQAnZCX468762;
	Wed, 26 Nov 2025 13:36:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps1; bh=YvcWFfikQG/A1L1/sDzIqKQViINFg
	b8FOrDN3GZwCxo=; b=KgU5fiq/ojDyGMZNBmopcjjPvt4Q6gbA+bbFh8sJYxAWa
	PrScrtQhA3MgcwZXu+psU/rfd2wuN9YqDR8hOu9W2Upf8eCJQ3t7KOXGX2vz5slU
	MXjsOdPwN7wML7rI0bQ/ZSWdhvSSFz4XdOX2V83670HH3AHmfe07WktTP5faLyP+
	x7zwKeAOUf4udyYd6nDqIEe7VwBbhZmELtEJriA7fC/pJJzmAZFYeAXCsGR/iIMy
	xtEiqPamPYa9CT28KIlDuXLlGp4obiy0v6Fv/osKS/P3hy2WztqVIdHT0djN9B0o
	etV4x7EuA40BcNOmlv01M0cz7RB7vdLc1PLG91luA==
Received: from intranet-smtp.plexus.com ([64.215.193.254])
	by mx0b-0046e701.pphosted.com (PPS) with ESMTPS id 4anvc6s4j5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 26 Nov 2025 13:36:41 -0600 (CST)
Received: from localhost (unknown [10.255.48.203])
	by intranet-smtp.plexus.com (Postfix) with ESMTP id 8C03C3C84B;
	Wed, 26 Nov 2025 13:36:40 -0600 (CST)
Date: Wed, 26 Nov 2025 13:32:51 -0600
From: Danny Kaehn <danny.kaehn@plexus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ethan Twardy <ethan.twardy@plexus.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Leo Huang <leohu@nvidia.com>,
        Arun D Patil <arundp@nvidia.com>, Willie Thai <wthai@nvidia.com>,
        Ting-Kai Chen <tingkaic@nvidia.com>
Subject: Re: [PATCH v12 2/3] HID: cp2112: Fwnode Support
Message-ID: <20251126193251.GA269764@LNDCL34533.neenah.na.plexus.com>
References: <20251126-cp2112-dt-v12-0-2cdba6481db3@plexus.com>
 <20251126-cp2112-dt-v12-2-2cdba6481db3@plexus.com>
 <aSdGh3i_KYocE3L3@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSdGh3i_KYocE3L3@smile.fi.intel.com>
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: GgD16-Dkvl2sczeH9RAqKajCQiO0G6PM
X-Authority-Analysis: v=2.4 cv=YMuSCBGx c=1 sm=1 tr=0 ts=692756c9 cx=c_pps
 a=356DXeqjepxy6lyVU6o3hA==:117 a=356DXeqjepxy6lyVU6o3hA==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=St4Fpg3H6rCxK3A6ySgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: PhPvQ9bF4TVOif3EeEqThiVmQnSUIoks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1OSBTYWx0ZWRfX2W28SDF/inQ2
 k/F+2zmnoGYKkow0uSm/iuRfXo3oPjIqwI/T0Zsluxi+OsQLUU3mknrQRKjCScvleBg5wAqz5xZ
 HPivKk5VfePz+s4eqAHwlkj/vBEwW2o1FPUNdn8AgJ+yAA0ZkiSkxR6vIQ+KCvSO4IZ49tmuKRO
 3Z7PoDoP0MXD9B5uIamBwqEXcFSlcQD7US8jmWE8i1OR6Z29JfW7OR1tnigDo7W/OkhPAhWTEt5
 Mayc9LZwQuKHzqW9I5ySV/dTuH3bUq9ZuiZ5KXfykpAGu3W4rUsGs6iX9bHVSAXfneLFOx1htww
 KltkdPyD924TMmtoEfExzVvJsYSIvcGivdvlaT9uGAI1r/T8swxT+eLbhp8wm8R4ZKo6o01HmBm
 MSCK+xU34cSz78L2AomyuEXMkJxbNQ==
X-Proofpoint-Spam-Reason: orgsafe

Hi Andy,

Thanks for the review!

On Wed, Nov 26, 2025 at 08:27:19PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 26, 2025 at 11:05:25AM -0600, Danny Kaehn wrote:
> > Support describing the CP2112's I2C and GPIO interfaces in firmware.
> > 
> > Bindings between the firmware nodes and the functions of the device
> > are distinct between ACPI and DeviceTree.
> > 
> > For ACPI, the i2c_adapter will use the child with _ADR Zero and the
> > gpio_chip will use the child with _ADR One. For DeviceTree, the
> > i2c_adapter will use the child with name "i2c", but the gpio_chip
> > will share a firmware node with the CP2112.
> 
> Hmm... Is there any explanation why DT decided to go that way?
>

I don't have an explanation, but Rob H. had directed that I make this
change in [1].

In v11, I then removed that child node for both ACPI and DT, hoping to
maintain unity, but you had directed that wouldn't be intuitive for ACPI
in [2].

Thus, in this v12, I have just entirely split the two, as it seemed
unlikely that any compromise to unify the schema between the two
firmware languages would be possible for a change/driver this
inconsquential to the overall kernel.

[1]:
https://lore.kernel.org/all/20240213152825.GA1223720-robh@kernel.org/

[2]:
https://lore.kernel.org/all/ZmISaEIGlxZVK_jf@smile.fi.intel.com/


> ...
> 
> > +	if (is_acpi_device_node(hdev->dev.fwnode)) {
> 
> Please, do not dereference fwnode, use dev_fwnode() or other APIs for that
> (actually the same applies to OF node, but people too much neglect that).
>

Thanks, will do.

> > +		device_for_each_child_node(&hdev->dev, child) {
> > +			ret = acpi_get_local_address(ACPI_HANDLE_FWNODE(child), &addr);
> > +			if (ret)
> > +				continue;
> > +
> > +			switch (addr) {
> > +			case CP2112_I2C_ADR:
> > +				device_set_node(&dev->adap.dev, child);
> > +				break;
> > +			case CP2112_GPIO_ADR:
> > +				dev->gc.fwnode = child;
> > +				break;
> 
> If by any chance we have malformed table and there are more devices with
> the same address? Maybe we don't need to address this right now, just
> asking... (I believe ACPI compiler won't allow that, but table can be
> crafted directly in the binary format.)
>

You're sugggesting perhaps that we explicitly keep track of which
addresses have been encountered, and refuse to do any fwnode parsing
if we detect the same address used twice? I believe the current behavior
would be that the "last node wins"; not sure if it should be a "first node
wins" or a full error scenario...

> > +			}
> > +		}
> > +	} else {
> > +		device_set_node(&dev->adap.dev,
> > +			device_get_named_child_node(&hdev->dev, "i2c"));
> 
> Here we bump the reference count, where is it going to be dropped?
> 
> Note, in the other branch (ACPI) the reference count is not bumped in
> the current code.
>

Great point, forgot that I had dropped that handling in v9. The old
behavior was that the CP2112 driver maintained a reference to each node
during the lifetime of the device (and released during probe errors,
etc..). I'm still a bit confused as to whether that is correct or not,
or if the references should immediately be dropped once they're done
being parsed during probe()... My understanding previously was that I
should keep the reference count for the child fwnodes for the lifetime
of the CP2112, since the pointers to those are stored in the child
devices but would usually be managed by the parent bus-level code, does
that seem correct?

> > +	}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
>

Thanks,

Danny Kaehn


