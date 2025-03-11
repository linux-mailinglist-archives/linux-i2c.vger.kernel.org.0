Return-Path: <linux-i2c+bounces-9777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C948CA5C072
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 13:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39C007A2A1F
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 12:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5975C25CC62;
	Tue, 11 Mar 2025 12:10:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA486256C8B;
	Tue, 11 Mar 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695041; cv=none; b=KbMTfW7jNgy/K1IVkiAkXjFUcf0LRyZgsGZE4fMgtHSTmme73346V/ZJDPPw5y34kHRphNHS8P3yVnfoaEeg5EubcShXqeDm6/PQZn4fQymFIyWJJGtIToCuD+E/1JB1qtbf2CkJDxOIzxVFZtF2ngN8ITZXeiewqWY1HJ5wnhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695041; c=relaxed/simple;
	bh=UPTPjdjk4RMU9w33sXP1VAsOX3CbPCQCjeVllOpIVPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR/jYKo0lYRRZUPxGWR+QimaWIR6GOTXnBBR6sZdNpNOLGKiQA43QiKHIZuWuQlLstEPxuL06reLRGmjrdjEd+D8emw8fWwek8oOJ3rT1o8rrX5NyKesTD9dLFo6pjFG36kMb7gwi8YgHL4cN5naozAqARQs/Vhklk3l3qm84K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F9CE1424;
	Tue, 11 Mar 2025 05:10:50 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1853B3F673;
	Tue, 11 Mar 2025 05:10:36 -0700 (PDT)
Date: Tue, 11 Mar 2025 12:10:34 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: <linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Adam Young <admiyo@os.amperecomputing.com>,
	Huisong Li <lihuisong@huawei.com>,
	Robbie King <robbiek@xsightlabs.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 00/13] mailbox: pcc: Fixes and cleanup/refactoring
Message-ID: <Z9AoOg-cx6xVW_Cu@bogus>
References: <20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305-pcc_fixes_updates-v2-0-1b1822bc8746@arm.com>

On Wed, Mar 05, 2025 at 04:38:04PM +0000, Sudeep Holla wrote:
> Adam, Robbie, Huisong,
>
> Please test this in your setup as you are the ones reporting/fixing the
> issues or last modified the code that I am changing here.
>
Huisong,

Thanks a lot for all the testing and review.

Adam, Robbie,

Can you please help me with the testing on your platforms ?

-- 
Regards,
Sudeep

