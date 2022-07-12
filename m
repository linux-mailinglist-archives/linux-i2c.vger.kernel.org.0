Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFD857156F
	for <lists+linux-i2c@lfdr.de>; Tue, 12 Jul 2022 11:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbiGLJOm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Tue, 12 Jul 2022 05:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232386AbiGLJOj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 12 Jul 2022 05:14:39 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EDC1437F82
        for <linux-i2c@vger.kernel.org>; Tue, 12 Jul 2022 02:14:37 -0700 (PDT)
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2040.outbound.protection.outlook.com [104.47.22.40]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-8nJAhFWCOiipo5K9uTdyiA-1; Tue, 12 Jul 2022 11:14:35 +0200
X-MC-Unique: 8nJAhFWCOiipo5K9uTdyiA-1
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GVAP278MB0456.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:39::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Tue, 12 Jul 2022 09:14:33 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 09:14:33 +0000
Date:   Tue, 12 Jul 2022 11:14:32 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220712091432.GA319880@francesco-nb.int.toradex.com>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712084716.bw626gt7cwcjt3wq@pengutronix.de>
In-Reply-To: <20220712084716.bw626gt7cwcjt3wq@pengutronix.de>
X-ClientProxiedBy: MR2P264CA0034.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::22)
 To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aea6aae6-0099-44bb-666e-08da63e6ef26
X-MS-TrafficTypeDiagnostic: GVAP278MB0456:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: W4iI01/Xq5dhV+QLNzpDrwYtuUZ+0ovo1r/HgPSSOk93HTqzEDDV3323U+rerZbn4TIO14YqdWTuFNmy/4ueeW7RNXzGPn5dovYLvOoel60yW1PaGePBf/jBLDabqiIgqqXvIrOoKt+BwlIOlAGm6CGntFjrh1CyIjJW4bEdPBrk9T6VPHaa0ZGRL0zrUle7RY64AsdSvD1KS3IuFJQkzl6Gay99zeUJf7FyG8LiWzbcbnk3zGBUNmx200Xzq31RaFc2H9aILHhDPT5is9Y/S7G3TP0tE8Scc52y0QYyXnnM9SAUGOyk4lulXkuqU0o5LqqzdxtOOGszIzQQ28R9QcV6ZwNV0KaNDYVymkI82ssg4gWgGsHSGdn7KJNLXo4abgygKKZ9i8cggyMS5B2GCqtjQtde+QWWn6aSHorLW/RNnsEgcwkRadom/ifdgkYedF5DvKJIvIUnnXupoMUZyCDWkJdstc0LdQAh3U7Gf6BXQTPKxPCNsPgzXl0sV0fh4xLo22nuSgjkQSkMk+4DBVBhuZGXb3zIa8mVBE/KBlWPeN74xdWQyontpXq5m96o2HHMGQPijkpcqtq/cAXipkFfew3Qj/tvzdQchTxaX6tH2j7FPDI6ddCwNVHseGYXxZeCbyRJd8eRAexnlJTKMb9Hfdgsg1I9CK6jEcpzByXVxTJHxJq2dWJwkwVV5+gUCvdyrEh+te6Dy7DLalzjhZqON3v6B03rvAVqDu5S5/Xbxv1UNaa6aI6wE7H2s5tZYo38KZ2fwjLQ3VgxW/R0iNr/tXPsycPhHfFrFCFevvcbKhu5B1g0vDmMTU7hbEX4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(39840400004)(376002)(136003)(41300700001)(6486002)(86362001)(6506007)(2906002)(6512007)(478600001)(8936002)(52116002)(44832011)(54906003)(26005)(1076003)(33656002)(83380400001)(6916009)(4326008)(38350700002)(38100700002)(186003)(316002)(8676002)(66946007)(66556008)(5660300002)(66476007);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IzZp6QJcHIQyZga95Ja5wQoKr4Cu/vkFlstTzDGiCJcmCkPFpHmAFKcoOzAz?=
 =?us-ascii?Q?lsLWWgIB9jwxrRC1DF2zh0hFINoOl5g909BkEfSoduXiRKA/86gN2+xe33dj?=
 =?us-ascii?Q?wtRsHaEw9RVMAIg4yjgRMWY2K8rypXOO2DL/3bPZM4hes/s1caOkDt4iw7Fv?=
 =?us-ascii?Q?RdobIE5mXAPAQcab5P0opYbhWCDVWl/GNx1EeRV61Asf8BfAovQaVvtjT2TF?=
 =?us-ascii?Q?vyPLIb0hzHAnTkb+vI4ULQugcmp40+gjyH5psBfkZa4IuDHM57YL7qXCx5AX?=
 =?us-ascii?Q?PX/j3mPF9V9AIymCR7d5tAYMcv4ObBBoyOHPdxdeBqwggqbnMNIvGzNPbJjB?=
 =?us-ascii?Q?Pt1AIk/DvUZeyh5COpx60kj+hv8VB/7zmWtEoHx0mmRPvRF3lboi3l9EDvzF?=
 =?us-ascii?Q?fTpuKANSq77vda/tfr005y8CH2feG6CFijxkZg4Xp0Nk7LJd48LmDVWDb6ux?=
 =?us-ascii?Q?6ka5B3immL0zJUigXRIqmLPZUlfoFMzxkwA0Kr5jeIk6c+4T5i8imAcVeTDj?=
 =?us-ascii?Q?xRoZK0j9OYbyVdOoiC+7iBWKtO9URhQ5hHwU2R+L0mHJbKqUdRvW2G/gi72I?=
 =?us-ascii?Q?sfq3VBKSfUc2fgFsuFNPMwie7yx8SHUGOci6uLCk0pIiFUJBSQLqpSOVmgzW?=
 =?us-ascii?Q?Zl2H8gVlrHTPyyx5JT+Fj7IVPOubh2P7VZmNzj02Ci1WFv6dtUk+jHPzE0vI?=
 =?us-ascii?Q?u7f4nptkSg4Kvc+gaymDGJQpyy4zqK0EkwD8nOkMw+uzgwgNRymr5mpewfUm?=
 =?us-ascii?Q?flqfISG4CWfILxWk5eicYpW7dLat2XxlPCtV/C189la9ZgeNzQ1IKt5rm3mr?=
 =?us-ascii?Q?/jKfQoiXqMls5Mnan2MQu7bf9ejR7WWPXg9Ytqw4MfMJlc1w32OwTc+TDJOB?=
 =?us-ascii?Q?42ghsuNGbFXdVu1cJ6PZNqnDs9XijTw08MRqc6SxYIvuRgk0lXg0bLkog8Nj?=
 =?us-ascii?Q?jH5gl2CMb1ZIqIQqmk1rgs0ltFxS0+8nlWKnC/HxNB/XBgXQg8iPIkjOi/IL?=
 =?us-ascii?Q?v6KGHLfnPHT9NF8XZYFKF2DERKGd4k9mEnIwhO88EBvSZ1oECFtxKjPmsg4W?=
 =?us-ascii?Q?881OhvyRxVh6O52y250S7/hMmgwohQnIpzR9BUi7tqxmSK3CBdMk8KZfNiFv?=
 =?us-ascii?Q?e5OFQaybz4/KEc3HLRlTYU6/9KImVfOJc6n2XTX2hLm/m0VRfoOy9Su7NOJy?=
 =?us-ascii?Q?i3oGR+hJhA2ZO8DyxYiUaUlc0QQTVeYI7bJ0XpvFBrApdqMci0G8Qr/t9BMd?=
 =?us-ascii?Q?QIizBoIrBoEd8EGEYxLkh+JsoyZYwxu0g1c6ObMunf48zUuWe4FfITymX5qm?=
 =?us-ascii?Q?JxyU8eEwJUt4WGZv36KuLBnCp9jBMOQ3G0jLHmhRSVVmRdRFZ/sPhXADGVt4?=
 =?us-ascii?Q?ysTqFSucm8uzq7bdCoc/LYhJ2guGLL03eBpMUDmIPcjauuIU23mWk0kZabbT?=
 =?us-ascii?Q?P8sMgbsEy07Qmyt+IWFVxXDreSMqHHC1TVopktHHZ7h2Yx0XhgnlC2FQwVUy?=
 =?us-ascii?Q?Byl2ebwPDHzi6CMHzlyAi04rIU5JXY/JY3KMfa6jITfBK/yYqJ8I0yxZ2iIi?=
 =?us-ascii?Q?3fLEJHn2O03oo3LrIzc0XqyrFauR6ZeQJ82i0UeaT6k4xANZfKnGKh7J7ETa?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aea6aae6-0099-44bb-666e-08da63e6ef26
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 09:14:33.2870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dj4Z7pvQfunoW5W3PE9nhoinPn2XpG+noGBrgGEiIOk6IhLT6cE/KADbYvYY3C2Aci3OTFm5KMyVpdBDEltixqZwTKpgr3V+jm70/Va7QEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0456
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CDE13A77 smtp.mailfrom=francesco.dolcini@toradex.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Marco

On Tue, Jul 12, 2022 at 10:47:16AM +0200, Marco Felsch wrote:
> On 22-07-12, Francesco Dolcini wrote:
> > From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> > 
> > Set the i2c_adapter retries field to a sensible value. This allows
> > the i2c core to retry master_xfer()/master_xfer_atomic() when it
> > returns -EAGAIN. Currently the i2c-imx driver returns -EAGAIN only
> > on Tx arbitration failure (I2SR_IAL).
> > 
> > Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index e9e2db68b9fb..26738e713c94 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -54,6 +54,7 @@
> >  #define DRIVER_NAME "imx-i2c"
> >  
> >  #define I2C_IMX_CHECK_DELAY 30000 /* Time to check for bus idle, in NS */
> > +#define I2C_IMX_MAX_RETRIES 3     /* Retries on arbitration loss */
> 
> Just one question: Why 3 and should we document this within the commit
> message?

In our tests 3 seems big enough to solve some sporadic failure we
experienced, and small enough to not have any kind of drawback. This is
the meaning of "sensible" value I have in the commit message, other
drivers use the same value.

Francesco

