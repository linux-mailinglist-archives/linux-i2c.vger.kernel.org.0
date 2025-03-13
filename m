Return-Path: <linux-i2c+bounces-9821-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55480A5EFAF
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 10:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCC523B36CB
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 09:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E635E264A7E;
	Thu, 13 Mar 2025 09:38:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8722641D4;
	Thu, 13 Mar 2025 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741858702; cv=none; b=b9Mm/an2I+CIO9+KmQzI8LyrRoJcHWUsLj6RXdcWQJR4vm3iQne0noPxbW8F0u4A0toa/Mty7mv8j5sx0xBZTlKtuILsF44G5mbytJk5kUcCD1UEvQZ9iXtsrPKum40tKYa4Zv2W9penHc6d6IAE6GOxnWaCcSK/K1EX2RtkEKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741858702; c=relaxed/simple;
	bh=+zRnvyYuwinJSmZOrxqeidL+AIOdo3cpe4HzFQMEQqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ptQfQI7g4oc71MtS34FKqINoDJzJeK8Pc6iBnytGRVLVOcF6SVjiufIlZPbKZjfwvnlgRdZtyKcV9r7RMj6uO4vJLWqEJBDjvdiOmoXhUPJItZd1qPPHg5jrMW5Wl+uaj5ToBp+Uh190SI0krwDky9A/dZkn251eH1SWJD8e1eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3EAA15A1;
	Thu, 13 Mar 2025 02:38:30 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1154B3F694;
	Thu, 13 Mar 2025 02:38:17 -0700 (PDT)
Date: Thu, 13 Mar 2025 09:38:15 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Adam Young <admiyo@amperemail.onmicrosoft.com>
Cc: <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Adam Young <admiyo@os.amperecomputing.com>,
	Huisong Li <lihuisong@huawei.com>,
	Robbie King <robbiek@xsightlabs.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 00/13] mailbox: pcc: Fixes and cleanup/refactoring
Message-ID: <Z9Knh0lQAHY6aEy1@bogus>
References: <20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com>
 <Z9AoOg-cx6xVW_Cu@bogus>
 <17a7ca5a-31f5-47fc-ab67-348df20b31ec@amperemail.onmicrosoft.com>
 <20250312200532.67xkag3joatel6m4@bogus>
 <7237deb3-ad30-457c-a1b2-c92db1c1e9f3@amperemail.onmicrosoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7237deb3-ad30-457c-a1b2-c92db1c1e9f3@amperemail.onmicrosoft.com>

On Wed, Mar 12, 2025 at 04:37:35PM -0400, Adam Young wrote:
> 
> On 3/12/25 16:05, Sudeep Holla wrote:
> > On Wed, Mar 12, 2025 at 02:04:51PM -0400, Adam Young wrote:
> > > The XGene patch did not apply on top of Linus's current tree. The other
> > > patches applied OK.
> > > 
> > Yes Guenter had mentioned it in his review. I have it rebased locally [1]
> > but yet to push out v3 on the list.
> > 
> > > I only had to make one modification to my patch to remove the call to
> > > ‘pcc_mbox_ioremap’,  as it is performed in the pcc_mbox_request_channel call
> > > instead. With that change, my driver continues to work. I will submit
> > > another version here shortly.
> > > 
> > Nice, I wasn't aware of the Ampere driver using ioremap. Is it posted on
> > the list ? Or are you saying you will post it soon.
> 
> It is posted to net-next.
> 
> https://lore.kernel.org/lkml/20250224181117.21ad7ab1@kernel.org/T/
> 
> I will post an updated version once this series goes in.  I don't expect it
> to merge for this kernel due to the dependency, but the code will be better
> for this change.
> 
> > 
> > Thanks for testing. Please provide tested-by for patch 1-8 if you are
> > happy with it.
> Happy to do so.

Thanks a lot for your time and testing. Much appreciated!

-- 
Regards,
Sudeep

