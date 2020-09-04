Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B181E25D75B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Sep 2020 13:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730168AbgIDLav (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Sep 2020 07:30:51 -0400
Received: from mail-eopbgr00102.outbound.protection.outlook.com ([40.107.0.102]:13283
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730069AbgIDLYG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Sep 2020 07:24:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW4E13skJ0etb8G+3RJzHY0Jc0MQ8OOBg8Hntg/uvbzsKMjWw1mbC0jixYO2z0lcFeykmKdtQrp0zRA8tXezKgWyFg7NquJdTly0puMF0B1wG0zteCH8pRNvrFCj9Wfg+GuCjvF4TF1FCbDRIfV5nXZVoqzqdIDFD/iOEBaP9AdOAPYsI7UivM+mHGc6gCX0TCnxoldcfZuNz07Onxd1DKAdXlhtm/I7lueC24vsATLYL5KtNNEYaDZfr88A9KKpyTnowa66PCyfAGM52kEKqb9xPNSek74wd8sueJFZ2TJcMDc2FaENVZ+BBw9PspuhE6i1Q8RvHIDaXV+Gc8pN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKZ7p81PcyPdAihQDAkR2rjbSCflKL4sE3bsr2fcqwg=;
 b=lsBO30R1aKzefszACpdobkPeA0tlNtQU/wkMrcphAMXvoSd6kRTp/T+XFwR6aARoJ0ux/k5ReB5+gZkR+YWs9Pa9buU3kW15UezoJpspJJUGUITQGvqSl8HSKcAhaTFHZcEOD7XAfgr5LzOCNt7NhaHFSOb0izCWcKcLCaL9kGMGjpyy7pyfi7bzIcFNoaEU6sm6PrKdAikqTwqOvLz3n+7cvpJVJHke/9jlmQzrk/LDYsoUju76Jtpwo+JOQ/qE6ZmOyJ1jps0m6rrDnRwwRG0cR64TrIrUUJ157bqoAvPG1+LqAVeD5Fw6BbIrVbbujkAVTOn8mlHw9hE6OHfCVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKZ7p81PcyPdAihQDAkR2rjbSCflKL4sE3bsr2fcqwg=;
 b=pUd8m9mUmG33xGjWN9ZkouhKZ3IIGI1HNvUztRJ9WfMxpFYaX3h4taJSkcw6EDBA3Cg40JUMqCjNaezQL49NmrBTjc8lVe872ZBh/msgB8jdC80ryCSzajxIS9jvNpoMvOTDmEWRi6EYX5OJ7zWCSocvCwotlbbqQZuDh4Ckcu0=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=plvision.eu;
Received: from DB6P190MB0535.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:3e::26) by
 DB6P190MB0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:4:88::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.16; Fri, 4 Sep 2020 11:23:13 +0000
Received: from DB6P190MB0535.EURP190.PROD.OUTLOOK.COM
 ([fe80::9cbe:fafc:3c8a:3765]) by DB6P190MB0535.EURP190.PROD.OUTLOOK.COM
 ([fe80::9cbe:fafc:3c8a:3765%4]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 11:23:13 +0000
Date:   Fri, 4 Sep 2020 14:23:10 +0300
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] nvmem: core: allow to register cells during nvmem
 registration
Message-ID: <20200904112310.GD10654@plvision.eu>
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
 <20200831015539.26811-2-vadym.kochan@plvision.eu>
 <6ab47f55-af66-f035-d8d9-82d0c831b5b8@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab47f55-af66-f035-d8d9-82d0c831b5b8@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: AM5PR1001CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::22) To DB6P190MB0535.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:6:3e::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plvision.eu (217.20.186.93) by AM5PR1001CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Fri, 4 Sep 2020 11:23:12 +0000
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c366b2f-0605-44a1-c86c-08d850c4e949
X-MS-TrafficTypeDiagnostic: DB6P190MB0008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6P190MB00088AD3AF780BDA22FDED4B952D0@DB6P190MB0008.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojFFkTOMeqQj+3TwgIjs0n/vM83hepoKwYbBvhq915GDTBTWVBBkC4CDq3uRPt1ukNuJ966FjNbzwrwyp5eYaD1KkcXuRYLgMBniKMUF0JiYQH+Rf/egvYv+kRXtEPo4BfmzhhkfqrdtBy+kKmkizucv97suRZl97U93EcxatoxfXLzfkrCxPQn62WIsQSxVUAXNxJ6vDj+bEO+5kWDvno3/ktNF7DdqgAffzMQ9minlZVtEzbM+PguPeYsMxjWCjZ5w4OgCSk2cS+v9ZWHfWc7u4Y3FwMFaE7/qSb6rWHg48rnPWRM9kjqJXJBXWzUbUeC8RhNtAVSe3OoyNkgXLA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6P190MB0535.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(376002)(346002)(396003)(366004)(39830400003)(6916009)(16526019)(66476007)(2906002)(2616005)(8676002)(956004)(1076003)(478600001)(66556008)(186003)(44832011)(86362001)(55016002)(8936002)(66946007)(8886007)(33656002)(26005)(36756003)(4326008)(83380400001)(5660300002)(52116002)(54906003)(53546011)(316002)(7696005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: DWOfA/QMH5mxtRn+bCU+NDdpyJq9m5hcz97c+wCzZrtJnkpETrczVUCTQkarwpkrZ4JC9N8ZwL29lPfJiVMMfT8GXjOghvMaYnXMrrubn/CViK81W6MaDBwh5DD/Qb8jrvEukpUMq27/d/ckwyUueKl09oMMe/ry3KqXRb1UPW1hNUeG40owSMnhlPjixXK4Vc0IDg8+qWEXex3TW5buuGo67VmfiII2Hlcu1VE27e07c99hnUsvPb6+fl9Jj/gyO6aj4yCzy+QM/iUl19x4a5Ts17Hj+lmlXkV1nkGO5DpphCeFGkibe1EV1Ct/J3lZM4X9aK6BwL6A6VM8ZWfSRbO4dNnKBuocC2550QT+Y2ZyMQYu1ylVQtY/SYiJ0IMV6NursfPQY8T1iV9BxreLsCjF8tXOdf0BTmJRW2WJ1BIRKlW06rzc9ThkBZPeeD11NGBBh2au2bp42/5vNwmi7QCvJgFvYv+6s3w+smIRtWpKiyCuk3hwh9VqNJBeYMOtA0Gew+/udlkzdcWvfyBiLRnX9ph5ZhQsnYSclJCa8q6S6Fby8WpTaG7SykX1eH5eYLC88appR2vwR+gg/zAZgTe9hLuIFymJoNa8GbbOdTL1Q1KnVJox3qUXRNnp6OtVyH6c8VNhGr2Z3ol+lgXAJQ==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c366b2f-0605-44a1-c86c-08d850c4e949
X-MS-Exchange-CrossTenant-AuthSource: DB6P190MB0535.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 11:23:13.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2aOpAqW3dWILirDsermHohEFWVMFUk85B/11sWq6ywr6BNMaQt4B+CYRLNwMQ8xEGgy1itq0wq8Y714siVlYxey07SUiPPPKEU9P3vrTzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6P190MB0008
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Srinivas,

On Fri, Sep 04, 2020 at 12:02:40PM +0100, Srinivas Kandagatla wrote:
> Hi Vadym,
> 
> Thanks for the patch,
> On 31/08/2020 02:55, Vadym Kochan wrote:
> > Add NVMEM_PRE_ADD notification step which is called before any cells
> > binding - from lookup table or config, this allows to register cells
> > in some specific layout (tlv) which should be parsed first and then
> > registered. So there might be a cell parser driver which can register
> > lookup table during this notification step.
> > 
> This is going in right direction but totally not correct way to do it.
> 
> 1> this is not scalable as any consumer that will register for this even
> will have no idea of which what kind of parsing that provider needs.
> It can work in your case but not really useful.
> 
> 2> this is a consumer API, not the provider api.
> 
> How about adding a "parse_cells" callback in struct nvmem_config along with
> encoding type.
> 
> 
> thanks,
> srini
> 

Looks like I missed main point here that this cells parser should be
registered as nvmem provider. I will think on it.

Thanks,

> > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> > ---
> > v3:
> >      1) Update core.c changes by extending notification mechanism
> >         by adding new NVMEM_PRE_ADD event id which is called before lookup
> >         table cells binding, this allows for notification handler to
> >         register cells which require nvmem parsing.
> > 
> >   drivers/nvmem/core.c           | 2 ++
> >   include/linux/nvmem-consumer.h | 1 +
> >   2 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 6cd3edb2eaf6..c48a69e0ebbe 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -668,6 +668,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
> >   			goto err_device_del;
> >   	}
> > +	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_PRE_ADD, nvmem);
> > +
> >   	if (config->cells) {
> >   		rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
> >   		if (rval)
> > diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
> > index 052293f4cbdb..0f7107276756 100644
> > --- a/include/linux/nvmem-consumer.h
> > +++ b/include/linux/nvmem-consumer.h
> > @@ -50,6 +50,7 @@ enum {
> >   	NVMEM_REMOVE,
> >   	NVMEM_CELL_ADD,
> >   	NVMEM_CELL_REMOVE,
> > +	NVMEM_PRE_ADD,
> >   };
> >   #if IS_ENABLED(CONFIG_NVMEM)
> > 
