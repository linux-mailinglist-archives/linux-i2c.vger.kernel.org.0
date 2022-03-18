Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2124DDB4B
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 15:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237068AbiCROKy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 10:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237024AbiCROKy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 10:10:54 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E17B657A8;
        Fri, 18 Mar 2022 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647612575; x=1679148575;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=bWqJsOTD8JiUP3/aKoY5m9fc2ncpVKEy1s6027tzTEM=;
  b=ggf5det3ZZ29/dalfqnNoiqKQkl0qQMfd9P8iqX4ySxM1o41eycJ2c8q
   T69r2ZxJEOoI5TippmIBIQfU40umkrCm2VKKZXe10dBPVFgOITExzYwhB
   6a0RJ/37MmvOn8D1MN49jNrpDszjts8KhUwQguFlKDxozHwPG9bnlArfJ
   0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Mar 2022 07:09:35 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:09:35 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 18 Mar 2022 07:09:34 -0700
Received: from [10.110.88.130] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 18 Mar
 2022 07:09:33 -0700
Message-ID: <fdc572ba-2e06-6038-9b02-405860767266@quicinc.com>
Date:   Fri, 18 Mar 2022 07:09:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] i2c: add tracepoints for I2C slave events
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        Jamie Iles <quic_jiles@quicinc.com>,
        "Graeme Gregory" <quic_ggregory@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20220308163333.3985974-1-quic_jaehyoo@quicinc.com>
 <YjRkvPc9uahbozbQ@shikoro>
From:   Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
In-Reply-To: <YjRkvPc9uahbozbQ@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 3/18/2022 3:53 AM, Wolfram Sang wrote:
>> +	if (trace_i2c_slave_enabled() && !ret)
>> +		trace_i2c_slave(client, event, val);
> 
> Why '!ret'? I think we should always print 'ret' in the trace as well.
> Backends are allowed to send errnos on WRITE_RECEIVED to NACK the
> reception of a byte. This is useful information, too, or?

Ah, you are right. As itself should trace all events including NACK
cases, it'd be better to print out the 'ret' too. I'll add it to v3.

Thanks,
Jae
