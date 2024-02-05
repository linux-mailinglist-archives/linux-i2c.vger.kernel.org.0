Return-Path: <linux-i2c+bounces-1633-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E2584948E
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 08:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7442C1C23E37
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Feb 2024 07:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A42F10A1B;
	Mon,  5 Feb 2024 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNvvStYs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4B10965
	for <linux-i2c@vger.kernel.org>; Mon,  5 Feb 2024 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707118213; cv=none; b=ItTsyPa1I4INpFunBHs8P0hv2MTKWo4QtzgJ0kvygs0Z+y7ykCAo1UwuI15pW4zn1IFG3F2agWt9byNZQ7MgqQgFpB20Ifz3vtnT+HGqPunkChAfnTBgvGhqqcqc2VFhBJFKqQzOiW4vTg7ll3M4Y34BcJZCcQJG3Eb1hrEjNEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707118213; c=relaxed/simple;
	bh=Yibri1B0g7XG7ok08ijuhlRxqFfA153Z05lg3ICE+NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdlwrEhD4GRZ6T6D5TykiEu5heiwhOPTCKTWV0xBruZOEmNhOL3QLmzJoVwRqLWRcg+DzfUQaLnuFwmy8ExYOkJSxo7kuxjgFEXvjcas0D2FalUAFbimZB2SF2Yw/ii/0YW6BSqzBwZBcIJnORUm0XrphL0GoCdd/gIXMBF0huY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNvvStYs; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707118212; x=1738654212;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Yibri1B0g7XG7ok08ijuhlRxqFfA153Z05lg3ICE+NA=;
  b=ZNvvStYsSZWtgeiKmkD+kD+HuE1W3yPXKcwWzgNcA0Y6VAA0SK2S/W2n
   sNlt/zBCdMhTKB5zJRFc9X70C7FH5TFfIkbOCN/AVJZiTx/riww9/YmwU
   QNkdr5pso/+TQ8ehK2GPtFPwHzideBiXGTGgeAoCyJesjYvhO6lu1Db/b
   4cXErn/90kkL9xoCBZ+t/Th6TfEYIxAwmcJpGU5Fk6+o8iJ+fxoFu9xiB
   jpPC9Yl9Y6XC9eu6tZ4ORMk1WRF25d9L/dm4FYQX97ZMBdXxqzLihRoj/
   GpoVFjuKdd+GRI9IItwJ4ftjXpuhNfgejvrAGkQQc7/pWNsuERw2vhWzt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="22947492"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="22947492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 23:30:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="909224221"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="909224221"
Received: from unknown (HELO [10.237.72.159]) ([10.237.72.159])
  by fmsmga002.fm.intel.com with ESMTP; 04 Feb 2024 23:30:08 -0800
Message-ID: <8827aeed-f618-43f1-bc6d-fedc65e8fed9@linux.intel.com>
Date: Mon, 5 Feb 2024 09:30:07 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] i2c: designware: Generic polling mode code
To: Jiawen Wu <jiawenwu@trustnetic.com>, linux-i2c@vger.kernel.org
Cc: 'Andi Shyti' <andi.shyti@kernel.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 'Mika Westerberg' <mika.westerberg@linux.intel.com>,
 'Jan Dabros' <jsd@semihalf.com>, 'Sanket Goswami' <Sanket.Goswami@amd.com>,
 'Basavaraj Natikar' <Basavaraj.Natikar@amd.com>,
 'Michael J' <michael.j.ruhl@intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
 <062201da5719$0dccb790$296626b0$@trustnetic.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <062201da5719$0dccb790$296626b0$@trustnetic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 2/4/24 05:20, Jiawen Wu wrote:
> On Wed, Jan 31, 2024 10:17 PM, Jarkko Nikula wrote:
>> I've been testing this on our HW which all have interrupt connected and
>> tried to cover also FIFO depth defines for Wangxun 10Gb NIC. Obviously I
>> would like to know how this set works on your real HW.
> 
> Hi Jarkko,
> 
> Sorry for the late reply.
> I've been testing the patch series on Wangxun 10Gb NIC, it works well.
> Thanks!
> 
Thank you very much! The first priority for this set it must not cause a 
regression on your HW and I'm glad my idea works :-)

