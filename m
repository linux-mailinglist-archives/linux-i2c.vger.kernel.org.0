Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F42D350F28
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Apr 2021 08:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbhDAGjt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Apr 2021 02:39:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20661 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233024AbhDAGjR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Apr 2021 02:39:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617259155; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WTlV2xRuqBGN5yAQfQ5SfEWrU6o6mEBhlV6AOHQK0lI=;
 b=V4+0MlsHFfurvxacopLjaB/QYtw2Shx4rnOMWFuQ+zEK9cZn7am2ssdTYGyMVgl+87uXDqv+
 LNimgu2t+8F/AeDztrvP/er02UYp3RQcaBDkevUgK0B0k65rLR7D43Hg5gWtsbEQh2eVCUUF
 zY2MOfGq/WhNFuFknYTm73bnKQU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI5ZGU3NiIsICJsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60656a938166b7eff7386475 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 06:39:14
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E286C43461; Thu,  1 Apr 2021 06:39:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7533DC433CA;
        Thu,  1 Apr 2021 06:39:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Apr 2021 12:09:13 +0530
From:   rojay@codeaurora.org
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for
 'assigned-performance-states'
In-Reply-To: <29b30a2c0c4d7292747a073d23daaa70@codeaurora.org>
References: <20201224111210.1214-1-rojay@codeaurora.org>
 <20201224111210.1214-4-rojay@codeaurora.org> <YAGqKfDfB7EEuZVn@builder.lan>
 <6bfec3e6-3d26-7ade-d836-032273856ce2@codeaurora.org>
 <CAPDyKFqF0NE3QRAEfiqj5QOXXH2om4CpyyeudeqoovANfvjsaQ@mail.gmail.com>
 <20210119110516.fgbbllyg7lxwwfdz@vireshk-i7>
 <CAPDyKFogrWt=K3VtEZVH5bPL_fYt7rgdm5wGgq+QHtzX-n0z7g@mail.gmail.com>
 <29b30a2c0c4d7292747a073d23daaa70@codeaurora.org>
Message-ID: <cfd90d2a05aa0411ee7a976a89a361af@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2021-02-12 14:51, rojay@codeaurora.org wrote:
> On 2021-01-20 19:01, Ulf Hansson wrote:
>> On Tue, 19 Jan 2021 at 12:05, Viresh Kumar <viresh.kumar@linaro.org> 
>> wrote:
>>> 
>>> On 19-01-21, 12:02, Ulf Hansson wrote:
>>> > As a matter of fact this was quite recently discussed [1], which also
>>> > pointed out some issues when using the "required-opps" in combination,
>>> > but perhaps that got resolved? Viresh?
>>> 
>>> Perhaps we never did anything there ..
>> 
>> Okay. Looks like we should pick up that discussion again, to conclude
>> on how to move forward.
>> 
> 
> Soft Reminder!
> 

Request Viresh, Uffe to discuss on the way forward.

>>> 
>>> --
>>> viresh
>> 
>> Kind regards
>> Uffe
> 
> - Roja
