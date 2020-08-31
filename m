Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC18257F87
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 19:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728824AbgHaRYw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 13:24:52 -0400
Received: from mail-eopbgr130115.outbound.protection.outlook.com ([40.107.13.115]:8450
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726927AbgHaRYv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Aug 2020 13:24:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQtXQzIbHG+CG4RBWyNEM7DVCkCYRpTFRrTveVNcm8FhUVmpePcuYEELhP7QEXSA44rCnbGD5CqSy4nVp+UJGBRLLStYMEKv4ue6T/CqkV1bcJP5cQqJRetXv1igny2n6+L29l0lfPTDANxKFqilMQRnv5ookt3sPq0YjdjzrPbp+YbjoiW4O5EdFs5vtG8+x2ZYxdySH4jVtU6W6TQ1tiFfSOTezOsE8iXgQQmnxyvH+8Ytke1fLexI/8a1C1NKUP58f12oqqYmeuJgHl752lRjjtT6XYjC6zzNQqgSq6h5pyyzg+8k+bjiVaXoHvT+Ihf+kbP0M5YVjWCtBpuJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFpGu1JCqtf9DCFrAo1Q0lLEyKDRt4F7VGmP9U22W4s=;
 b=dur8o+Z9mIc+/zozeaOwHMRGgVwwixfNmIMkpm5q1859GJ0Uo12VR6wtzLWNW00Z75fr5HTcVhXTAFPh8zoaZa7JAW1GlkuKiN/l73le07OQvPAl2mSNDd6vSTirk4TneABtPyjmLPcj4TroYC/T3zr4fdq4gVjZ4o2G3+aIFBWJxqXZ8e/lxCoQ8T7haqae04bBoxrbTy8vqZnp43EZp7t7rzC/utYKdhMa/chrGvWPokTYC5JcW0xPvL60O0jqkYOTc8kDHk+iTvDWQ9grveMzJmEsVlRO8uS7a5gzeSXktPYWpMKsn77RlnCiqjq9OEMk7bwfis3MM50sYFUWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=plvision.eu; dmarc=pass action=none header.from=plvision.eu;
 dkim=pass header.d=plvision.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plvision.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFpGu1JCqtf9DCFrAo1Q0lLEyKDRt4F7VGmP9U22W4s=;
 b=dfhJn/e/YZN0uaPLywQEjm0KEoUrXdRE5jh3m4BxtGpdcon9wcSBpiU35B/L9eQYCAFrKk9YOD9cAiYRxiZUK2DJ6eswr2DxKu6kHN6xg+7jDuDzB1MovFzNyteZ1eH5XNWYAH3HfhaCRLbTylrq6L5WkJNBNwRMHt7RCbTjGwQ=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=plvision.eu;
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:56::28) by
 HE1P190MB0057.EURP190.PROD.OUTLOOK.COM (2603:10a6:3:c9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Mon, 31 Aug 2020 17:24:47 +0000
Received: from HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305]) by HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 ([fe80::b1a4:e5e3:a12b:1305%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 17:24:47 +0000
Date:   Mon, 31 Aug 2020 20:24:43 +0300
From:   Vadym Kochan <vadym.kochan@plvision.eu>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] misc: eeprom: at24: register nvmem only after
 eeprom is ready to use
Message-ID: <20200831172443.GD2568@plvision.eu>
References: <20200831015539.26811-1-vadym.kochan@plvision.eu>
 <20200831015539.26811-4-vadym.kochan@plvision.eu>
 <CAMpxmJXzGPXwMYg6e+eCYck+nXnNqxSEBOwm5G-vmLYQA7cDpg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMpxmJXzGPXwMYg6e+eCYck+nXnNqxSEBOwm5G-vmLYQA7cDpg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: AM7PR03CA0016.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::26) To HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:7:56::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plvision.eu (217.20.186.93) by AM7PR03CA0016.eurprd03.prod.outlook.com (2603:10a6:20b:130::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23 via Frontend Transport; Mon, 31 Aug 2020 17:24:46 +0000
X-Originating-IP: [217.20.186.93]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 850add18-4abe-4e44-55b3-08d84dd2c21e
X-MS-TrafficTypeDiagnostic: HE1P190MB0057:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1P190MB0057311D6BC4CCFE92984B4195510@HE1P190MB0057.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /lFEbPhW47nasb8f5JDQRB6wHTn7qsG8pWfEUepJBxblZainP5uQmRFJK/Kb5EIHMd3faNuD+0lU/KjP8GTR+6Ok/EmNXBaqtwM7eXM3u0TSPnZJc5gFG2l4uSh87riK2GYiPMnkSDeA6Wm08krh8gEDrevfwoSjsu6pGDJ+iMac/nR+PeKzXNXnc9wKStKfqGLUTxDIDPgZVeBfjcxJm8uCqfug1iawsaIFj8CfiKpxSscCgMk5GXInXkR9WafKKU4SAfatekJeCEFQQmkeMlgTqmIMpUSnhaYhL5ruOeYdySD8nObPBdddTJpJiqT/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1P190MB0539.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(136003)(39830400003)(366004)(396003)(346002)(36756003)(478600001)(5660300002)(316002)(2906002)(53546011)(8936002)(8676002)(6666004)(8886007)(55016002)(66556008)(44832011)(66946007)(66476007)(54906003)(1076003)(186003)(2616005)(956004)(26005)(6916009)(86362001)(4326008)(83380400001)(33656002)(16526019)(7696005)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 4noxNGfUkus9iCoJb4IcAs5NU9r4HgQ4mNEGsemhVJ1EBqDLF7pLiFPuR6YCQiMat88pLqo3JG9gabT8xT/a0XbGZc3DN/gGqZgZYWNSt/Ifb72P1frSmh34WnhMqEZcWPiaWxJQLGxlLeJd7ocTuDBZEY4ZxZZywoljySVicAo2d8IVYHGRhdX/SBkEEKpIAFFwoxG9HMEWMVjTjcxQ1c6o/IrV7bv4cgZEfxuWczLQnlljX5nDDVz0goRpDedAQhrJFpzOEq6KC1PSbd0AePU7C0rOfATCYzJp1KMKb6qJL+hrvtj6WWfc5NLfnUJHa0QjaLSfuqz4jkGremRJhsIeB5VDqOe+ZtlAMmIjfB/+yinVZ63GSTymrfzrFMR97SJ92Wxxfwo1QVvNft70/01587OOspEW+5rhyUWRmfJXn8VbsTxlcR5EufN5uyn9Z5IW9G5DXmPj50rCN2Bz+nLtFONNI7h9X6Pe7XQ4fptNr2+FkzD3B54Ef9XDe+HIWrW+C2ZXDgO4YBf+CEQ6OPUFNLSwakTVy16EJMWmnJ5PXDKJRxcJoVfdaznDDuNDJgevoUzbSersaGR2WRfipNqyu8p2gtXt0Sf8n7EwLrI36tK2gkYNdUaOVDDbS+C0E6EFjsg8p4zwH+AAx1bu6A==
X-OriginatorOrg: plvision.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 850add18-4abe-4e44-55b3-08d84dd2c21e
X-MS-Exchange-CrossTenant-AuthSource: HE1P190MB0539.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 17:24:47.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 03707b74-30f3-46b6-a0e0-ff0a7438c9c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbhZzYpA0pfwYqGh0FU+OP2WTcTGxvG+UQ9xztFVEOX0ewzdjKBhfwD8cn29ff8bd/l/jRV8+e+KIFQfum74P2gwHQOn6J/SXQuPI7YmNQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1P190MB0057
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bartosz,

On Mon, Aug 31, 2020 at 07:21:39PM +0200, Bartosz Golaszewski wrote:
> On Mon, Aug 31, 2020 at 3:56 AM Vadym Kochan <vadym.kochan@plvision.eu> wrote:
> >
> > During nvmem_register() the nvmem core sends notifications when:
> >
> >     - cell added
> >     - nvmem added
> >
> > and during these notifications some callback func may access the nvmem
> > device, which will fail in case of at24 eeprom because regulator and pm
> > are enabled after nvmem_register().
> >
> > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>
> > ---
> > v3:
> >     1) at24 driver enables regulator and pm state machine after nvmem
> >        registration which does not allow to use it on handing NVMEM_PRE_ADD event.
> >
> >  drivers/misc/eeprom/at24.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
> > index 2591c21b2b5d..26a23abc053d 100644
> > --- a/drivers/misc/eeprom/at24.c
> > +++ b/drivers/misc/eeprom/at24.c
> > @@ -692,10 +692,6 @@ static int at24_probe(struct i2c_client *client)
> >         nvmem_config.word_size = 1;
> >         nvmem_config.size = byte_len;
> >
> > -       at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> > -       if (IS_ERR(at24->nvmem))
> > -               return PTR_ERR(at24->nvmem);
> > -
> >         i2c_set_clientdata(client, at24);
> >
> >         err = regulator_enable(at24->vcc_reg);
> > @@ -708,6 +704,13 @@ static int at24_probe(struct i2c_client *client)
> >         pm_runtime_set_active(dev);
> >         pm_runtime_enable(dev);
> >
> > +       at24->nvmem = devm_nvmem_register(dev, &nvmem_config);
> > +       if (IS_ERR(at24->nvmem)) {
> > +               pm_runtime_disable(dev);
> > +               regulator_disable(at24->vcc_reg);
> > +               return PTR_ERR(at24->nvmem);
> > +       }
> > +
> >         /*
> >          * Perform a one-byte test read to verify that the
> >          * chip is functional.
> > --
> > 2.17.1
> >
> 
> Good catch! Thanks for the patch. Can I queue it for fixes
> independently from the earlier patches in this series?
> 
> Bart

Sure.

Regards,
Vadym Kochan
