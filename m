Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73D3DF4195
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Nov 2019 09:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfKHIBn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Nov 2019 03:01:43 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:60009 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725975AbfKHIBn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Nov 2019 03:01:43 -0500
Received: from [109.168.11.45] (port=39820 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iSzDA-0015oN-C7; Fri, 08 Nov 2019 09:01:40 +0100
Subject: Re: [RFC PATCH 01/12] i2c: replace i2c_new_probed_device with an
 ERR_PTR variant
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191106095033.25182-1-wsa+renesas@sang-engineering.com>
 <20191106095033.25182-2-wsa+renesas@sang-engineering.com>
 <cd25c799-bb10-aa59-8705-b079eff2165e@lucaceresoli.net>
 <20191107192236.GA961@kunai>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <9a7efd33-8a7e-1e2e-11f8-64c2ab900a4c@lucaceresoli.net>
Date:   Fri, 8 Nov 2019 09:01:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107192236.GA961@kunai>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 07/11/19 20:22, Wolfram Sang wrote:
> Hi Luca,
> 
>> I beg your pardon for the newbie question, perhaps a stupid one, kind of
>> nitpicking, and not even strictly related to this patch, but what's the
>> reason for these functions being declared extern?
> 
> I did this for consistency reasons. I agree that the 'extern' keyword
> could need some second thought, yet I think that should be a seperate
> patchset. And that does not have priority for me, so if someone is
> interested... :)

Ok, got it!

And then:
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

Bye,
-- 
Luca
