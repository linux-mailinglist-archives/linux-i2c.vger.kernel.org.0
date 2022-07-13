Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC0055737BF
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jul 2022 15:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiGMNnl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Wed, 13 Jul 2022 09:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbiGMNnj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jul 2022 09:43:39 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EFC431014
        for <linux-i2c@vger.kernel.org>; Wed, 13 Jul 2022 06:43:36 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2109.outbound.protection.outlook.com [104.47.22.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-oH78qU--P3aIueCYyqCrHQ-2; Wed, 13 Jul 2022 15:43:31 +0200
X-MC-Unique: oH78qU--P3aIueCYyqCrHQ-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0044.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:18::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.21; Wed, 13 Jul 2022 13:43:30 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::3d:ca30:8c24:1a95%7]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 13:43:30 +0000
Date:   Wed, 13 Jul 2022 15:43:29 +0200
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1] i2c: imx: Retry transfer on transient failure
Message-ID: <20220713134329.GA495155@francesco-nb.int.toradex.com>
References: <20220712082415.319738-1-francesco.dolcini@toradex.com>
 <20220712090514.lt4r4dvlkn55jf2o@pengutronix.de>
 <20220712100504.GB319880@francesco-nb.int.toradex.com>
 <20220713115750.GA504159@francesco-nb.int.toradex.com>
 <20220713132437.GF24373@pengutronix.de>
In-Reply-To: <20220713132437.GF24373@pengutronix.de>
X-ClientProxiedBy: MR2P264CA0181.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::20)
 To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f17106b-240d-4799-16f7-08da64d5abe6
X-MS-TrafficTypeDiagnostic: ZR0P278MB0044:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: J/tVOcGU4t1z7ZeR6R0V6pZdfDi+k6I86i5TWrsGVAGL7iqlL96cZNLOdUi9nXxMFU1z42h9vRQ8Ut1uKK23UojNR48pnOitxt3/PfQXKtiFZJy+WApvJXZDsUUxJqxtbkDlvSSgHkeH8KJGh2t0qbzgk5SAVRsQbh2oY8JWmzeM9+46HqC7yo+se01umMvYivJfL7M5nJlKN6witJyK2PrnEL57DMYF0alb2DpDapQTnHzz2uAymKu8TO6xBx5IwWsI3hxT6McN9OLOWy2JF8v+g4Ozs1wukAr72rZ5vC/6vPtqMzCitWYDGuL0Q3fEr2BEgTnBlITNOPW8/wvBkIq6/jQtozgewSm6QUw+N649RfNMOX0diIIYqr0vjp6zqPeUdzJqpBEIdsuoNK0whrke/yQajkUAwiiBBI3dLMNoKN5oMRZZI1X/+trxiLrwGPmOUqBjOQt1FlehGt+3p8c2sbHZSsTYuxHeVjcviLPxVChArfqdve6Pqa6zxg1ER58phV7Ay8cuZwAqJrfjTCKv3C9hsUGs7L+20MYPUdfZgODiPxo8Y86uTLorTSGilDxQkG8hDPh/NqOEN5+rQ1VEuBgLDpbE2wlG+Q2avjdNoENSWaGywk7OOy47rWbFY2560eWCXYRy8gW8RUk4oPa2SAAVbVtMsYFLHxFlLXNhgwqbRjtMJOO8BF1/wVVQGr+VElX85vYOph5RdtjrC7b97yDGd8wS76sjkipT6MklIhuFqvZr4oZgjA1I2/zhz9j1KMxgdmAwULHCLH02YOi0HSZM+Po80Aa+P+itewXVMMI3pJq6ZR5NqB1puXp8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39840400004)(376002)(136003)(366004)(6486002)(4326008)(6916009)(54906003)(478600001)(2906002)(316002)(41300700001)(66946007)(1076003)(8676002)(83380400001)(66556008)(66476007)(186003)(38100700002)(38350700002)(6512007)(8936002)(6506007)(7416002)(44832011)(66574015)(52116002)(5660300002)(33656002)(86362001)(26005);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MGs8tLnpcgBjRiTFLfYHANWt+oluq3YCBxRlGdXOUQ9vQiOzl0s3F3S0XZ5A?=
 =?us-ascii?Q?3G9A4nEWam8oAKDrwzCkOVOdTaqPF77yzoO0LqniHu6ptTdZvqMLJViDt6Uo?=
 =?us-ascii?Q?cDhr0qM67KBieCY9j+bAID67AI1WqpfdIopj9TFGiUh3EZq6vXUsxMJ94Gv1?=
 =?us-ascii?Q?mHTlycNk933m6qi/dsPr7bX6MG8IN0fYiVlHcYxueXiQS5SCCg6W1+xvMFzS?=
 =?us-ascii?Q?vUc+JPBklLIQMmQXr8ge7NzNeetarwHfd8xHKZP/Ho8FPoYuF3pgDPgnpVya?=
 =?us-ascii?Q?mt7b++o7JRm4sVZsOEhnxRDCZmnApEeLa5chmZ91GTkg6QiVJsRryl6i7IBi?=
 =?us-ascii?Q?ALPk4+IVf3f7S70dDUXTTpMYrfjTQ4bqKyUHN+VpozXQQudZ4+kvDNCas/iy?=
 =?us-ascii?Q?wa0trcXxuXVIMlKswHucs9RwsYRYI01rtM9WxRtl9CztbseRoGpQsrD0VXkP?=
 =?us-ascii?Q?p2P1QNgMKQBCzAKyEvna+mrAsbu0rBNR1g0/0nhYBinO2afB3xUH2ZqN6/gM?=
 =?us-ascii?Q?4Hi3f4cntArXliOO2yFW0H9UiosmtPFqNh8oh5BrO0GlJ+6j8JYjlR65NA2/?=
 =?us-ascii?Q?eBCTz0E5E+Nq6pBNayhm/9Ls9gslYTEVfRkPERZtUZsayjLfghQUGJhE/dyH?=
 =?us-ascii?Q?wctUMEgVe7wlvnJfFKqNc8DQfSl5gPBabqegzXapCcuFZkKVAOtruYg9bP/y?=
 =?us-ascii?Q?dEtW0H544Q9BAIELf98HZZ3dCcbSjF9v+ynICyvKeBpLmK5P+5kmYqvmLu2Y?=
 =?us-ascii?Q?qFOqaWelYhwKFxQbt2xyy/k+JshDy1i8c/1hNRpdXcpeeHlXhRwswzwm4+nV?=
 =?us-ascii?Q?nAPOuzE7y2c+78SrOvWHNE/8EnyMHyz/3ONPi4tgUaI5rKIwFQsrwZR1/2zX?=
 =?us-ascii?Q?O0/XN6xY3ogVn8iwl58Wsa/reLMoXMn8+1T/H8n5IKJyVuHcGAaVaaY5iWlw?=
 =?us-ascii?Q?KSavrAs8kXXQlBZzHqebAQ05XtyavW0d+BRuYk4XfDo3elgP23SGkagx0MNW?=
 =?us-ascii?Q?0mFkW8fPPKv0VuCeRqVSUARuNUiciFK99yUGqC7CZ+5RJnTX+pJqjq6W2ufY?=
 =?us-ascii?Q?jVH7HCTbMjVLz+z6C4rvSwAZS2bCzKeXgSIj5IQje9aDAley6rz8G9oSvOR6?=
 =?us-ascii?Q?Qnt9pMZFigAeKNaK0hV17gwt1u1XK3U6RtP/YI0lt0xXdxz7W5jtLfTTO4Ud?=
 =?us-ascii?Q?44mFH8GO11kJFujPNbuqh6rA/iXwXPVW5LJSgW6lO8cjbl7UZ1S98RGeoo3T?=
 =?us-ascii?Q?Rnb4WMiKYZDM0gt9aYJHJTlB5tSFTmnO6oU+h/SHdIeBU4keqZR+NGi5Ajpf?=
 =?us-ascii?Q?fbgBDjsu4JL4c9Bl12VZebnzPK2reMuzr34TAXEDoH03753iN15zulzxh3ET?=
 =?us-ascii?Q?XR8QVrS829ynqT9KEYQO92Z9PZFiH8irnhIS7eKFjvzhhWGxpHO+7toLFXtZ?=
 =?us-ascii?Q?H0fm0IpPaS4HTNCWK9VIyFr+1gA3Q49KEr+TqMAk1saOol8Q2V1IlB7bMf2J?=
 =?us-ascii?Q?qwz/bdTlebbirH8/gjMopouk0DH2Za5A0C1YYBc5J6yYAsPaikITBDAD0Z0e?=
 =?us-ascii?Q?WU7qPrumZDROIeN81GW7N1P0iWInbv/rDUXkKbHiPrVl3UQ1xpZZwyC6bGOu?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f17106b-240d-4799-16f7-08da64d5abe6
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2022 13:43:30.2079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGGeAt8x7GzoZWYTKbLQxLx33tQfAlBEiFR9dT3BxzfvZ5gq1riHkI7DK7a92MY8Lk0DsvdfO/LRbEI9tKhqazDC69KXCpSF262s5H9zaG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0044
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

On Wed, Jul 13, 2022 at 03:24:37PM +0200, Oleksij Rempel wrote:
> On Wed, Jul 13, 2022 at 01:57:50PM +0200, Francesco Dolcini wrote:
> > + oleksandr.suvorov@foundries.io
> > 
> > Hello all,
> > 
> > On Tue, Jul 12, 2022 at 12:05:04PM +0200, Francesco Dolcini wrote:
> > > On Tue, Jul 12, 2022 at 11:05:14AM +0200, Uwe Kleine-König wrote:
> > > > In which situations does this help? Please mention these in the
> > > > commit log.
> > > I'll do
> > 
> > I did some investigation on this, unfortunately we have this change
> > laying around since 1 year, it was written by Oleksandr, and in the
> > meantime he moved to a new company. I added him to this email thread, so
> > he can comment in case he remembers more.
> > 
> > We introduced this change while working on OV5640 camera sensor on an
> > apalis-imx6q evaluation board, without this change we had some sporadic
> > i2c communication issues. Unfortunately I do not have any better
> > details.
> > 
> > To me looks like having some (3? 5?) retry as a default is somehow
> > more reasonable than to never retry, not sure if this should be
> > implemented as a default for all the i2c adapters. From what I was able
> > to see that would not be a trivial change (the retry parameter is coming
> > from the i2c_imx driver, there is no obvious way to have a default in
> > the i2c core).
> > 
> > Would it work for you to keep the change as it is (just getting rid
> > of the useless define) and add a little bit more blurb to the commit
> > message to include the various comments collected so far?
> 
> I assume, it is related to reset time or other reason where the camera
> is not responding. In this case, amount of retries would depend on I2C
> CLK speed and host CPU speed.
> 

The retry on the I2C IMX driver would trigger only on tx arbitration
failure, that would be the SDA being tied low by the slave in an
unexpected moment, correct? If the camera does not respond it will just
not ack the transaction and that would not be recovered by the retry
in this change.

Can this just a layout/cabling issue with some noise on the SDA line? We
are talking about somehow long board to board cables with various
signals on it. This is an issue that we had for sure in the past,
however I do have record of this only on a different camera.

Francesco

