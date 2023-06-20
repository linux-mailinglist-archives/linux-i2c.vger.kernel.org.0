Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE447365CA
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Jun 2023 10:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbjFTIKr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Jun 2023 04:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbjFTIKk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Jun 2023 04:10:40 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F657B1;
        Tue, 20 Jun 2023 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687248623; x=1718784623;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VpJCnNI6H9j3ZzdLVYAv1Wy+CxzK+DXVX911nKhiCQ4=;
  b=cj07Y50UnJ4fLhx557Sr37vbP4ghiquH2/deQZfBSCpstrTLYX8REZFh
   4oA5NM41Ak7Nj+5msyKXjjzdLa72887lbPBA4aQNF1EcgWVk9OrkrKZqT
   86xz3XtoblipVcCgAUz3F37MGVEdQRmW6Tj0EV9732foW0uIsk+JgeY6L
   dePP8pTW1l64kSPnpTCTnGFQoKVMxMJ2nNIk0Vcwzrlfp9p5LW8zAU7lL
   97esMvVSBluZ6VT9jJEIifzBHHPVxt6COiCrDZwTjcxaKWYK3CMjiDkKd
   rHakOLs0DUNI/vIAgBmTAdHBGG1N8H5yOILLRuAyZPlaO+oYedfBmTnUa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="339409805"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="339409805"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 01:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="713954052"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="713954052"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 20 Jun 2023 01:10:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 01:10:22 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 20 Jun 2023 01:10:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 20 Jun 2023 01:10:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 20 Jun 2023 01:10:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2s7Qe0WW/3D9Ah+RUDt8nAo0t1xD4fI4mqBoSq3Uh0/8vMhCYufh8y0gXUE2mUx2IQRynVxYqknqu3F3Z1iQ93AZi4jc9tS2EE2X8EjrSeC8ja86ISgGWqJbvfYaYaUo5quSvrF0nwNyCWnJ9fNBc8q7ufbQmu8Z9DncAAgo36Fkz5eB0sJa8tf47HiyAkuFD7KmfmU5Kc5fOhOpwu68TH3U2h21CNHDIBIeX3rQuwcbemxEhwi1LIN+X24ZkXOBktNTk4HXt1L06R/AemJQIbTxFSjv132URVeNJd5i0vIJLJfbMq8n1i0JcNm6+phZ6v2+IPEFLGX9x/Vxl73jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLHwBpV2JY13eEBJK2muvc7HqV+Ju+4ByQA0JJfoJug=;
 b=SiVAbt9etboKoZbiO6VWcxLwz+Al6CGx/9h+eMsZY4ERPcwWGdwRsPP/FfUKmuvoTaKdG868cHyl4ZFy8fownCt1jFTRxtfksQLU3NR4PdvueR+l9XOc0MCHjWWBS9KDxyjZ7rMcyQNcnD6XduoLOpdz/8W/T99ZxUEXULIi55hMOTqpvA6sNh8Kcfj7s970F/6ItJYDvX/+NbOvUjCw+iJxVNS3QQA69rTmBzbgWbbzcElCjapTZgGUXVAdl7MXgFlV2wr9lO753ZSbZ3pVGxOIzV4V3SVZwo/TLOfs/aBNNIjl/geK/NsHTm9XIk0ecGwnsxkmfDOTMI0GV868bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 08:10:19 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::9358:a28d:ae08:7ab8%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 08:10:18 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Ye, Xiang" <xiang.ye@intel.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Oliver Neukum <oneukum@suse.com>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Marc Zyngier <maz@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Zhang, Lixu" <lixu.zhang@intel.com>
Subject: RE: [PATCH v8 0/6] Add Intel LJCA device driver
Thread-Topic: [PATCH v8 0/6] Add Intel LJCA device driver
Thread-Index: AQHZhDKWwr++ubSkb06m0tkHIUZjS69X53eAgDusxeA=
Date:   Tue, 20 Jun 2023 08:10:18 +0000
Message-ID: <DM6PR11MB4316C4C6EC9FB0FF333BD0698D5CA@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <20230511175844.185070-1-xiang.ye@intel.com>
 <2023051318-anchovy-sincere-65e3@gregkh>
In-Reply-To: <2023051318-anchovy-sincere-65e3@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH7PR11MB7450:EE_
x-ms-office365-filtering-correlation-id: d8a5409e-c6ac-4284-a931-08db7165c92b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xSfdLGl9JXnInqJfNm5bjCfWu8Wr/qv31Dx6877KS0+bPEBmpXJFZaIbBuskuZV9aGw5VYC038zkh41bFfYY/q/A9GvO7jHk6iK4VwuRxZbPD5aFSrz1t6kVC7K1qPHUqCh9aOi8qE6DviUd68lay33zeWecNCgXhN9YRLKMQg4lBBakQt8gP+gTTOX/LraJVGk66ZS302s5Fz6jtUUbim0D8D8w3FvcOTtzwHQw5w9NcRxhFhg4MqZx+JEgu8hUI+Ps2DhFQRK3oorMmR5FWOkm23RciLHql2eSl5mVTzir7nf4RZSI2HOe5U50fP/iBK+CDeSMgfhMQrhOCXNTt5oMSs7l1/rXkSuH2FiEdCZFvHJd1Q9txgqZvjnV0LEiSKH2kJKOrRQkWIiFYO+8wQ8P81BIDUb7SwdCY4g9yPN/4zRGAFfkgrKQ0YsAVwMkddRPDJkFKwsnjqV2N94Qy/1nt7/wiy7Z39t1lGGNEYoT8svQdrs37zPKCUo0MKQEx+nLkyBDxfK6Snx/mQjU8ZRuRk4mE5RAR++oT2QaAy9EjNtUfA5D5p3cjeagbnak3qLUMHJPiv/BOHSjCE3m96Jc7EClAFiZE1dGrzyhK+QXP4p477aPdRejvmxmgDGm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(83380400001)(478600001)(86362001)(71200400001)(7696005)(64756008)(66446008)(66476007)(316002)(66946007)(82960400001)(4326008)(66556008)(122000001)(9686003)(26005)(6506007)(186003)(38100700002)(76116006)(54906003)(110136005)(52536014)(7416002)(5660300002)(38070700005)(8936002)(41300700001)(4744005)(2906002)(55016003)(8676002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qybHJIxjlR046wLAxeR836HU2DKWvsF7K2WeDcD/o0CDExtKOvOtv/HPpYYm?=
 =?us-ascii?Q?lwtTzlO5vT0apZZd7pJlpp1cybq9U06BIPGga3TArZcX0ZGuqYVfzIAlzLTg?=
 =?us-ascii?Q?B2DcmLuXW340g3YydjMWZKIniU6fhyPTwNQhgSOSamdjjbCaW4Vpalfe+JkU?=
 =?us-ascii?Q?gHG1F53w12+H7e6ZbKC3goHhL4NkuSZcJJdRaicaGaATJRpL28tyTTwxZbBt?=
 =?us-ascii?Q?5G3kLzg2y2mWatPbxhOemnGN+8Rm4RCMONK7HnK8NF4iEMx5mPseU9DgzMq+?=
 =?us-ascii?Q?45b7gyA7a0AXEE5eOK0ewFyb3V4x+4tItLLf4M4dMyjk676QOMKs77GHisqx?=
 =?us-ascii?Q?qZiHnvX/aryU8+uzYYIo+gA3UIj8Cc/J5AGjfiTP7JARjZa92hWnW8K4hX9D?=
 =?us-ascii?Q?xhu79V7EdUoTvFmCgX6hhVF9NayzR6fQJCpe2HP/wifwgumNenNY/8dURKkv?=
 =?us-ascii?Q?Yd2Wbch2qFCIYNJWdspsotznQ9aUhO31cGm2qIxQnGAO6uVttqQSJbUTIW3Z?=
 =?us-ascii?Q?X5ZvWFX4lOcHtyNSyx4FO4r/FPTpF7hzFaAQgg7CBPchJ0YhwaeOIX4cyC5E?=
 =?us-ascii?Q?NQBE0QOTXbsEGU9LrU3fHDRrQPAntSVD9PimX79IA3CUXtApwfFMUplAIO2Z?=
 =?us-ascii?Q?dE8DkDHGSAWs9LMIcHlJ1pcrfoB+WOY89NAuPXX1I9r0MqtkvUlalGOGPVBk?=
 =?us-ascii?Q?Ns/K9H7F4OY/Hf5jlrA8ThRhkPb9aqdrovvnvOCEuDxmp7w5AeCO2ML1O74r?=
 =?us-ascii?Q?cP7XYZ2aqcP84A3BJxsxlH+baEEZuSTC7E6xHcNcLIsi1zUUaigxPSSLIN2B?=
 =?us-ascii?Q?xDqAcCVfTvbQSw2Do6A7E/hxFJzl6my0fWXKts/hvhQJ7sd4gCIDCyW2Ot8+?=
 =?us-ascii?Q?vngtDS2ttz0wFEk2MXV3Y2xpBqH9ayKxGtRd5CaGq/NKo/w8y5DtBJIg5P+g?=
 =?us-ascii?Q?pA6sDmAW6079QZ36nL8K+g9zMQifoxXy22giDjEOCtokiigeFpe8KYBf/Wav?=
 =?us-ascii?Q?t7Y+K2kjg4q8c4go2sSAtkdjUCwzhUqzWXF60dt5ivjjl1HTnawqJhxsrpoi?=
 =?us-ascii?Q?hryoNQpVTTyaHNGuY+wPlL8bdCTOcnwMcSsmSD7UBN1DMlaG32HcoG7o43V3?=
 =?us-ascii?Q?OwP+R4ZGUeG9QcUJXjOSB/C0e4KB4f4N1J279FiJB9LJsgAIDK+j7b1v00Lu?=
 =?us-ascii?Q?Kum0h6E7Kt8vTU+wTwXahcUUnD7ezbe05MF63fS+TKgf3QQe96bIq+7GNnKa?=
 =?us-ascii?Q?N/i6S2i3wPKpzdcRwUxRowYsMTpJx0foN88bC1eR1HRaVqVmr4Ya8gSNXh69?=
 =?us-ascii?Q?H7YkVmnK24RA3vtNIRsj6sh7p3o6q+x2oKxqB7Zq6K5Jits0K+OCxhJg32tL?=
 =?us-ascii?Q?uz8SY5DeM3gGU6BobjUcRQcvi7ApSlqFktwMk3Ri8/aRKk8+4ewHC+Ut+EGs?=
 =?us-ascii?Q?VTDaZEO7NYyipHSG+2yFyutI74Rjl5TxId9lpWcQ1OUqp4TuI08W8ggn5Wut?=
 =?us-ascii?Q?XTQmqQHgYL4+mcf0KwsrcVU955xzfouFaOIRQU5zfm/UB2/WjTnwWHHLnqKM?=
 =?us-ascii?Q?7y7eJ08SsT78S+6KQDMAaIaF3fY5Yk/Yh3xESmRp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a5409e-c6ac-4284-a931-08db7165c92b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2023 08:10:18.3419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dHB/zX6Ojkr07a6ytSyg08gUlfgAgwKQ5ilPvbIk/0JotncqBMwu9X3kS1hurqa17ZAldJbsbyZCSA+qw/4yeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Greg,=20

Thanks for your review.

BTW, somehow I will take care this patch set.

Thanks
Wentong

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Saturday, May 13, 2023 4:50 PM
>=20
> On Fri, May 12, 2023 at 01:58:38AM +0800, Ye Xiang wrote:
> > Add driver for Intel La Jolla Cove Adapter (LJCA) device.
> > This is a USB-GPIO, USB-I2C and USB-SPI device. We add 4 drivers to
> > support this device: a USB driver, a GPIO chip driver, a I2C
> > controller driver and a SPI controller driver.
>=20
> I am sorry, but you have not followed the required Intel-specific require=
ments
> for submitting code like this.  Please work with the Linux Intel develope=
r group
> to resolve this issue and do it properly for your next patch submission a=
s I can
> not take this one for this obvious reason.
>=20
> thanks,
>=20
> greg k-h
