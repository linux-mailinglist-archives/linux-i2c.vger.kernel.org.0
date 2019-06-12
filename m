Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B54F42857
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jun 2019 16:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407785AbfFLOEQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jun 2019 10:04:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60641 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407762AbfFLOEQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jun 2019 10:04:16 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190612140415euoutp0173b5a3121001510c6622bbf59be1defb~neHiKrbjt2494324943euoutp01T
        for <linux-i2c@vger.kernel.org>; Wed, 12 Jun 2019 14:04:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190612140415euoutp0173b5a3121001510c6622bbf59be1defb~neHiKrbjt2494324943euoutp01T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1560348255;
        bh=sPdSdE4qsvSbaMak0sr8YcOjHPVPjBPKJgIQWVV5LTI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ByooAjIRm3rFFDei4YHPfD5wqM5phX9lu433HkJZ2iWchvC0FAMpFlTzoUjo6rqsw
         Z7xDIEHLd7B7gMqR5Fo9gj5r99HF6Db7PC7VTscsF78heCSVng3Xx1MlCJbhXqLmEI
         TdmENNzgTSuCPCW68YOhwQmce+UIofuJ+uKr9gMM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190612140414eucas1p1038570cb76911800945c01500eee9d4e~neHhiY01d3019030190eucas1p1H;
        Wed, 12 Jun 2019 14:04:14 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id CE.8A.04298.D56010D5; Wed, 12
        Jun 2019 15:04:14 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190612140413eucas1p1b72f9da419ac23b227fd7316b1bf3de6~neHgj5MGh3020330203eucas1p1G;
        Wed, 12 Jun 2019 14:04:13 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190612140413eusmtrp10452264c3bc4df51d72019284fa2cc4b~neHgVF4JW2651626516eusmtrp1b;
        Wed, 12 Jun 2019 14:04:13 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-08-5d01065d1a86
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id EC.61.04146.C56010D5; Wed, 12
        Jun 2019 15:04:13 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190612140412eusmtip1ab3d5e919d1d18ce372ca3125f4a0e3b~neHf-G_0v2528925289eusmtip1K;
        Wed, 12 Jun 2019 14:04:12 +0000 (GMT)
Subject: Re: [PATCH 02/34] gpu: drm: bridge: sii9234: simplify getting the
 adapter of a client
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <87d7a499-22b8-5e9f-8da2-54c83d1c4b2d@samsung.com>
Date:   Wed, 12 Jun 2019 16:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608114036.GA4786@pendragon.ideasonboard.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7djP87pxbIyxBvP7WS16z51ksvi/bSKz
        xZWv79ksOicuYbfo+PuF0eLyrjlsFn3n3B3YPfZ+W8DiMbtjJqvH9m8PWD3udx9n8ni2cD2L
        x+dNcgFsUVw2Kak5mWWpRfp2CVwZs7/cZy74zVvxfQp/A+MW7i5GDg4JAROJ73f9uxi5OIQE
        VjBK7L97mAXC+cIoMWnBFtYuRk4g5zOjxKd37iA2SMOXuy1MEEXLGSW6532G6njLKLHv1yN2
        kLHCAgkSN7+IgTSICGRL3FgxjxmkhllgEaPEh9ZmsKlsApoSfzffZAOxeQXsJObd2sAOYrMI
        qEq8P3uCGcQWFYiQ+LJzEyNEjaDEyZlPWEBsTgF7iev3/zGB2MwC8hLNW2czQ9jiEreezAe7
        TkJgF7vEwfZ2JoizXST29u5jhbCFJV4d38IOYctInJ7cwwJh10vcX9HCDNHcwSixdcNOZoiE
        tcTh4xdZQT5jBrp6/S59SNg5Sky5HQZh8knceCsIcQKfxKRt05khwrwSHW1CEDMUJe6f3Qo1
        T1xi6YWvbBMYlWYheWwWkmdmIXlmFsLaBYwsqxjFU0uLc9NTiw3zUsv1ihNzi0vz0vWS83M3
        MQKT0Ol/xz/tYPx6KekQowAHoxIP74Hp/2OEWBPLiitzDzFKcDArifAaZTPECvGmJFZWpRbl
        xxeV5qQWH2KU5mBREuetZngQLSSQnliSmp2aWpBaBJNl4uCUamDkq45LyPmix+H7O+nedrWd
        8/71fDi3X0ayt6Xo+YvYIqu44Pf7f+/a8lfga8Ta03lz7luKf5Czn6ERbe/AwMDYI6+//LXl
        q1uzVos9fc75yTLyrkSqzNvnXSxtW4xC+jSXBT4T8cq2UPRc3TCZtaVX6MZb0Wc5kz/69Bs/
        vv5799JPrmfire4rsRRnJBpqMRcVJwIAYJ6ghj4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRmVeSWpSXmKPExsVy+t/xu7qxbIyxBtfULHrPnWSy+L9tIrPF
        la/v2Sw6Jy5ht+j4+4XR4vKuOWwWfefcHdg99n5bwOIxu2Mmq8f2bw9YPe53H2fyeLZwPYvH
        501yAWxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJ
        ehmzv9xnLvjNW/F9Cn8D4xbuLkZODgkBE4kvd1uYuhi5OIQEljJKTJt2iRUiIS6xe/5bZghb
        WOLPtS42iKLXjBI7WlexdDFycAgLJEjc/CIGUiMikC3xt3Uh2CBmgUWMEj9W3ANrFhJoY5L4
        vDUTxGYT0JT4u/kmG4jNK2AnMe/WBnYQm0VAVeL92RNg9aICERKzdzWwQNQISpyc+QTM5hSw
        l7h+/x8TiM0soC7xZ94lZghbXqJ562woW1zi1pP5TBMYhWYhaZ+FpGUWkpZZSFoWMLKsYhRJ
        LS3OTc8tNtQrTswtLs1L10vOz93ECIy8bcd+bt7BeGlj8CFGAQ5GJR7eA9P/xwixJpYVV+Ye
        YpTgYFYS4TXKZogV4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR5HxgUsgriTc0NTS3sDQ0NzY3
        NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cDIMnVn0+/fwW9ZrM7vvKJ8wMljU3a68Y75
        vAe7myZNKWkRuhf1o2/ZswczOTh9LC6siG5m6rj9S0CzXCH3mXnI0j+JtvfdTK3i4n8lHWk/
        81db6haf6JGwmL8nW7W3nm3nvTvTf4O7CbeZxpl/rEndF5JfKSsnRFnc4+N8Lqa477dM3u+/
        kfFKLMUZiYZazEXFiQBfsOB60gIAAA==
X-CMS-MailID: 20190612140413eucas1p1b72f9da419ac23b227fd7316b1bf3de6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190608114101epcas3p4127647ce1c8224b4d777585bfa8e31d1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190608114101epcas3p4127647ce1c8224b4d777585bfa8e31d1
References: <20190608105619.593-1-wsa+renesas@sang-engineering.com>
        <20190608105619.593-3-wsa+renesas@sang-engineering.com>
        <CGME20190608114101epcas3p4127647ce1c8224b4d777585bfa8e31d1@epcas3p4.samsung.com>
        <20190608114036.GA4786@pendragon.ideasonboard.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08.06.2019 13:40, Laurent Pinchart wrote:
> Hi Wolfram,
>
> Thank you for the patch.
>
> On Sat, Jun 08, 2019 at 12:55:41PM +0200, Wolfram Sang wrote:
>> We have a dedicated pointer for that, so use it. Much easier to read and
>> less computation involved.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Queued to drm-misc-next.


Laurent, for unknown reason patchwork does not collect yours tags, and
it is not the 1st time, added manually.


Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej


>
>> ---
>>
>> Please apply to your subsystem tree.
>>
>>  drivers/gpu/drm/bridge/sii9234.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
>> index b36bbafb0e43..25d4ad8c7ad6 100644
>> --- a/drivers/gpu/drm/bridge/sii9234.c
>> +++ b/drivers/gpu/drm/bridge/sii9234.c
>> @@ -815,7 +815,7 @@ static irqreturn_t sii9234_irq_thread(int irq, void *data)
>>  static int sii9234_init_resources(struct sii9234 *ctx,
>>  				  struct i2c_client *client)
>>  {
>> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
>> +	struct i2c_adapter *adapter = client->adapter;
>>  	int ret;
>>  
>>  	if (!ctx->dev->of_node) {
>> @@ -897,7 +897,7 @@ static const struct drm_bridge_funcs sii9234_bridge_funcs = {
>>  static int sii9234_probe(struct i2c_client *client,
>>  			 const struct i2c_device_id *id)
>>  {
>> -	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
>> +	struct i2c_adapter *adapter = client->adapter;
>>  	struct sii9234 *ctx;
>>  	struct device *dev = &client->dev;
>>  	int ret;


