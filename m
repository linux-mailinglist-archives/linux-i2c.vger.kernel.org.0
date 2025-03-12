Return-Path: <linux-i2c+bounces-9815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CFBA5E4F4
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 21:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 957B1170316
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 20:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972AC1EBFF8;
	Wed, 12 Mar 2025 20:05:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BC81E5B71;
	Wed, 12 Mar 2025 20:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809942; cv=none; b=fjX+GTVFY75koMKSfp3gllD1d0IKppKpcCxvifNthLlH06KSbFiwZshoMspzJ5Oz7wJu/dsDQ1Ekb0HW0Y5M+lefDF0AUXdownEbKvFR/4W8YaOhleFHEMPfptcOtByLR8HXnSFhiSE9zUBKFeBVfqkmiBDo+n1jG4VyTY5TTeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809942; c=relaxed/simple;
	bh=DTexTALS8AbU1aaD5ZlJp1i/lrORRxTCW3JHhyXfH7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIMP+YQ57uoX8bcC56LPT9ujIthGJmBDuY5X9+AwxuzvDppSGqppKt8c78aZ+P+pjd4reV7h9vUVlhXQC7t+x4YiJxwo+WB8NW3z8ZlA6Bhi3LNkcGQPtlpcV4KPBdPINMM2IZEoJBMRDXQR5KlW4ZbI2GYeo9NImXKCrDxdo3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D64413D5;
	Wed, 12 Mar 2025 13:05:49 -0700 (PDT)
Received: from bogus (unknown [10.57.39.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B416C3F694;
	Wed, 12 Mar 2025 13:05:35 -0700 (PDT)
Date: Wed, 12 Mar 2025 20:05:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Adam Young <admiyo@amperemail.onmicrosoft.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adam Young <admiyo@os.amperecomputing.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Huisong Li <lihuisong@huawei.com>,
	Robbie King <robbiek@xsightlabs.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 00/13] mailbox: pcc: Fixes and cleanup/refactoring
Message-ID: <20250312200532.67xkag3joatel6m4@bogus>
References: <20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com>
 <Z9AoOg-cx6xVW_Cu@bogus>
 <17a7ca5a-31f5-47fc-ab67-348df20b31ec@amperemail.onmicrosoft.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17a7ca5a-31f5-47fc-ab67-348df20b31ec@amperemail.onmicrosoft.com>

On Wed, Mar 12, 2025 at 02:04:51PM -0400, Adam Young wrote:
> The XGene patch did not apply on top of Linus's current tree. The other
> patches applied OK.
>

Yes Guenter had mentioned it in his review. I have it rebased locally [1]
but yet to push out v3 on the list.

> I only had to make one modification to my patch to remove the call to
> ‘pcc_mbox_ioremap’,  as it is performed in the pcc_mbox_request_channel call
> instead. With that change, my driver continues to work. I will submit
> another version here shortly.
>

Nice, I wasn't aware of the Ampere driver using ioremap. Is it posted on
the list ? Or are you saying you will post it soon.

Thanks for testing. Please provide tested-by for patch 1-8 if you are
happy with it.

> I like the direction that this change is pushing, making the mailbox layer
> the owner for other drivers.
>

Yes it was long due. I had changes in my WIP but was away when you changes
got merged. Otherwise I would have asked you to do some of the changes in
this series. My bad, couldn't review your patches unfortunately.

-- 
Regards,
Sudeep

[1] ihttps://git.kernel.org/sudeep.holla/h/b4/pcc_fixes_updates

