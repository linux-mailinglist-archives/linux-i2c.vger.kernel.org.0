Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1896E51D39A
	for <lists+linux-i2c@lfdr.de>; Fri,  6 May 2022 10:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390253AbiEFIse (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 May 2022 04:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358066AbiEFIs2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 6 May 2022 04:48:28 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13825689A2;
        Fri,  6 May 2022 01:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651826686; x=1683362686;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fLBX9GbzXaLrNCQkVHxOtSlfQQ+hsbnt+ws0YOCuwuM=;
  b=ewnM6cmLNbUrQJNjq3Ub6OURDOMVxEYCkL+iVd5n9/tH353vuAWlwoxi
   3G3I3e5HZzfKx6uaTsuY3vt+h85RRlp1WI16anLCyS0My7Dt615ez/DV9
   BKFR5hi4EGtqSwrE/MN9TAtJkd/QVpFtvEiGq3yISe8esILa3kBSmszPD
   NB3aECKoApD6AUBoQAfOE8MxB9L7kuvs7e3LsJj6xRf6vJmeLOyibxT6x
   HD7gYxdi8HpdkVZHgKgY3cSP0+V+fybm0u3QyLBJqwSsQoRQB+2PlFyqI
   fNoAtFzp8nnM09Xa/JA/vZ5k454aE4fuUOrELXf7AgRJiK2o/6qDuChAP
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="267237945"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="267237945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 01:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; 
   d="scan'208";a="585863619"
Received: from mylly.fi.intel.com (HELO [10.237.72.150]) ([10.237.72.150])
  by orsmga008.jf.intel.com with ESMTP; 06 May 2022 01:44:43 -0700
Message-ID: <e6eacb51-bd9f-e014-5735-a624186458a8@linux.intel.com>
Date:   Fri, 6 May 2022 11:44:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Subject: Re: regression: Null pointer exception on resume from S3 with i2c
 DesignWare driver
Content-Language: en-US
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Samuel Clark <slc2015@gmail.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        LKML <linux-kernel@vger.kernel.org>
References: <941f292d-2ce2-d7aa-3d70-01a11ba171cf@leemhuis.info>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <941f292d-2ce2-d7aa-3d70-01a11ba171cf@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 5/5/22 12:52, Thorsten Leemhuis wrote:
>> Running Manjaro on a Gigabyte B660M DS3H DDR4 with custom 5.17 kernel. Confirmed on other distributions and kernels back to 5.12; issue is not present on most recent 5.11 kernel. dmesg traceback points to i2c DesignWare driver, specifically drivers/i2c/busses/i2c-designware-master.c:369. It seems the msgs struct passed in to i2c_dw_xfer_msg is null.
>>
>> Similar issue seems to be reported here:  https://lore.kernel.org/lkml/YY5BRrE8bLyvd3PB@smile.fi.intel.com/t/
>>
>> lspci output: https://pastebin.com/MwFM2VBJ
>> dmesg from crashed kernel: https://pastebin.com/t6GsHjkq
>> kernel config: https://pastebin.com/awrSve5u
> 
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?
> 
> Anyway, to get this tracked:
> 
> #regzbot introduced: v5.11..v5.12
> #regzbot from: Samuel Clark <slc2015@gmail.com>
> #regzbot title: i2c: designware: Null pointer exception on resume from S3
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215907
> 
Thanks for sharing the bug. The reason why it occurs after v5.11 is that 
the i2c-designware support for Alder Lake -S came to v5.12 and issue is 
hiding before it.

Looks like there are suspend/resume issues with i2c-designware on some 
Gigabyte motherboards. I commented in the bugzilla if Samuel can attach 
the ACPI dump there.

Jarkko
