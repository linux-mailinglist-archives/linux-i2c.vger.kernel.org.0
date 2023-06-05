Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C933721FD4
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Jun 2023 09:41:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjFEHlj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 5 Jun 2023 03:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjFEHld (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 5 Jun 2023 03:41:33 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E27DFA;
        Mon,  5 Jun 2023 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685950882; x=1717486882;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=THnIhnZPgYcez7jiZz9YZMWlzcLZYSgGI08ZGYeA+O0=;
  b=fX4XvsU7O9K6aQ5b7CIW7syYAyrv6+nC/k4qRGmCQXGaODrcF3wE8lPZ
   lAoqD7IFrGMKsK9OxsPEe8/tdgmdaDBbJDojDKeP+08IvOAj3r3KiZrYc
   ChZkIcvoxmzRziNUJtFlgQ0woOmlqqvPSwWhmgiHrLhuAm8C+v3kXiiHu
   bRC/+32fxk7Q8p1FJDbGDZgiiIUJbGbR+tuOBnyVh65W1JP/TH6qmETrb
   jp1A9ORi8OTP7fiM6BhTUH2gla7EC/d8kk3sK5+ZFDbuWu5MjJeE1RbLu
   AGWsV+oj8MztEqDJMSwF6TRcXuSbIYNrcH3iyoS1UpP94q1d7PshZh3ck
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358753388"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358753388"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 00:41:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="658979036"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="658979036"
Received: from mylly.fi.intel.com (HELO [10.237.72.143]) ([10.237.72.143])
  by orsmga003.jf.intel.com with ESMTP; 05 Jun 2023 00:41:19 -0700
Message-ID: <d560c9b0-d2cf-18da-3470-a51468413955@linux.intel.com>
Date:   Mon, 5 Jun 2023 10:41:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v1] i2c: designware: Handle invalid SMBus block data
 response length
To:     Tam Chi Nguyen <tamnguyenchi@amperemail.onmicrosoft.com>,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     patches@amperecomputing.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, jsd@semihalf.com,
        chuong@os.amperecomputing.com, darren@os.amperecomputing.com,
        stable@vger.kernel.org
References: <20230523082118.10935-1-tamnguyenchi@os.amperecomputing.com>
 <bf392104-96b0-a85b-f68e-088bd3884d9a@linux.intel.com>
 <6def5691-2462-9707-f75a-09931d26d4af@amperemail.onmicrosoft.com>
 <95d838d5-ea27-ef75-4ac6-575ebd75111a@amperemail.onmicrosoft.com>
Content-Language: en-US
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <95d838d5-ea27-ef75-4ac6-575ebd75111a@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 6/2/23 07:30, Tam Chi Nguyen wrote:
> Hi Jarkko,
> 
> Before pushing the v2 patch, I have one more question to ask.
> 
> The commit f53f15ba5a85 ("i2c: designware: Get right data length"), you 
> mentioned,
> does not handle bit 11 set (on a HW where it's supported) correctly.
> "tmp" was not marked with DW_IC_DATA_CMD_DAT when passing to 
> i2c_dw_recv_len function.
> 
> So I plan to update it in the v2 patch by adding this
>      regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
>      tmp &= DW_IC_DATA_CMD_DAT;
> 
> My question is: does it need a separate patch for this change?
> 
I think for now bit 11 gets masked since tmp variable is assigned to u8 
variables when calling i2c_dw_recv_len() and writing to *buf pointer but 
your proposal indeed makes code more robust both your patch point of 
view or any other future change. So separate patch makes sense in my 
opinion.
