Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADA226B8BC7
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 08:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjCNHPU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 03:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbjCNHPT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 03:15:19 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20AB9544C;
        Tue, 14 Mar 2023 00:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678778117; x=1710314117;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=O0RsJVL4hgEekpbmBIy4EpffC/WU1bVI25O6OVDNGqE=;
  b=ICBVTjMFXX1rkWC0BE2kj2211AuBaeb1MltnvbIxFOIGp1BTW4gdA/oY
   xGK8O0dF1qR1co9jZ/M30Shr5+A87+IHNNxSltAyuFWJb+P/pcpuYOJRF
   /eDNLaXxPOF+XqLPYjx6aoQNbCrolFYoO+mxNSm8jVNg0u69ybe9GKpQ1
   y2OFtsdy5y0MqQVMR5XEgVQNkwTE2Mnvstc0xfFAl4KdQ2DP50KybBM7w
   zD01J/eE6oXsFdLe0tAiMY0h0ejdh33yx8SPpcwXRdU1jNFdygD0Um0rm
   BdXKAb/L4d/wfjl8cFHg81Iiudn4klR5rBKfbI6tz41iabGzuaui9Ch/h
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338894641"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="338894641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 00:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="628938564"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="628938564"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 00:15:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 00:15:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 00:15:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 00:15:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 00:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+XmZfrU68wqNo+WliVy+4IGQhjfyc+Qf8Xpyp6Cnd0Oopj8wV1iSFwL4GaTiHqbgoopD8th4gPUiw710OZT33I7pKUpFn675QXi2bzzisyqtyTfMJkgtmGtG+5esfY4l8IfZEn5/GXfK3GmkSEtdUTIcyTD766oAyLW/Sb9zwqD6CCcB6Uyjy3w+DscPnEDFl9bXoKoVbTzXhz1wA+qYZS4jfGravnRFbCW2k1nwv1OLSr5XS2HbGEy7Dena92hby4PaGrT2eRcjx7S2X/0qlFfngB4f45mHArWXsixsUMyhQYV7yGt9zT38DKhy4JAM+h5MyRWcp9loNAJGprpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmiwOtXn9tk3u1xliW0CpArzaWDyUsBBjfuQqBeeBj0=;
 b=htqIPxWSZPQ+sC0+SAFBxAtIgOkkKv4Tm2f1VtZoElr5EmA4FpgLvH4ddmHs7DzXgoVlNUt/01aVyQEj6f7Ut+6TJtBuzVs2KB/gSuV6HT2M3tahvz322EV4QEzTM8hsCRPyCtvF66jOqxRqXXnVnYGk2i4pg/3gMDbXjUhfz3QEIcD5B+75jYfcGrGDZ9okzzPix+LP645X3LHIz2jcCcPH1Eczkjxsp8l8AKDsJDP88T1NLYWBXAyaavnsxisNKVBNecEzlW0creJweq4aMCiqu7ribqrkftajmKOeO5ZPLa8UVczExV+btpHti8sgxPtf8s9jE/0+BTI48aaXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.22; Tue, 14 Mar 2023 07:15:11 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 07:15:11 +0000
Date:   Tue, 14 Mar 2023 15:15:05 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Oliver Neukum <oneukum@suse.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        <linux-usb@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <srinivas.pandruvada@intel.com>,
        <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZBAe+bpKmvC1iVfq@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <097d1742-1aa8-fc0b-db11-3571ea49383d@suse.com>
 <ZAqukC7XfSbIa9ov@ye-NUC7i7DNHE>
 <ca995ed7-e6db-4265-e528-5e29fb418594@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ca995ed7-e6db-4265-e528-5e29fb418594@suse.com>
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|SJ0PR11MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b5cea4-2d04-4b76-c0e2-08db245bd96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7Km6xLxdlpTijM36fc9fbegpYqNloAe60rYwBT8jhfdH6kms2N1x8cTLfxFV3sAdLzmINJog6GoviyO+orPIj8d95vZ1kAxPJ8TJO3XA45K0z9dxT2M/OvOR9Jyx+5mpHe1rqTyU62iRQXs6G4yMBBTFcxq2ILrHiM5C/yZ6V4Mlbey0nBiDIp5/UWuyqJ06lsJgdQ+1WYA4z8S85b68Gv01Gj1XDWGFimTB689D4K/rfjhBbvBJ2y8HtuNTLROrTfQgEnVfsAj0oJ8EF2vmv7tMdKhyvI5EvUCdCNM/oTe6OqZEF6ay6q94SY2NyLYp50mRU9jJc1M8qoSb3oJZfobf+B4Ear8oAkwevAyGrmjKml7x448ZIfwNl0ysoAfZ17x2xj/faJUjS9nPiqSllTqaMExlZKBOK24HGv49ei8ivVUPc8wRNWeqbqeMeILRe8i3ksVYWjNwXbCnCBVl3IW8YZU/ufeHJsp/lirvYot8KcuDBJ/ZkvzN0FNlZdLJujubD73fdwKPis5ASUImUsLl57d30T0hjazXBLztw6UNogMqXoBDwvJ6gXRzYio+YQ3QbAw6S9HPDpnR1GUbCFcmXSMmIhdS8t5N72VzahH0k2Qjm3Z9OU1YJtrEwPoqTYuLHtv8LDZrt9nOb1VFnOnRvSmUgDwgaM9cC/PYdT6z382Cq8aU7FMgd349HQA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199018)(6916009)(6666004)(7416002)(5660300002)(8936002)(4326008)(66476007)(8676002)(66946007)(66556008)(83380400001)(54906003)(478600001)(6486002)(41300700001)(316002)(33716001)(86362001)(2906002)(9686003)(186003)(38100700002)(82960400001)(53546011)(26005)(6512007)(6506007)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mXPr3HhatrpyGmFhTFUAxfHThdj10Xh/1JC4T9WMCdVpQEqx4GEdnNQjoSW4?=
 =?us-ascii?Q?z/dmIG7Q9SRlvWcDbm9gGNPysaJb9frxvO2AMTqjNvBpL/00e77tHx8gcu/z?=
 =?us-ascii?Q?K2PoBdrf8LKaDXWRC1HkGpNNgFHQcvZyw7I3NIpMAh3tfh5NT70soxX7zCQo?=
 =?us-ascii?Q?ornqhWxKMRNYuDySg/q/tlW3qZU0pHXqPlZ4U/F8h7Rfx+8Q89EmkGWPjrxR?=
 =?us-ascii?Q?IxIpY14UtFu6wNwfIxggYYbjN/tL3eh1ME21z8wCL2m0v+H2kS/za9RaZXBD?=
 =?us-ascii?Q?ekss3Qw6pU8s4vPMW5NfxVKrjzw0szAmFO/+sJXIyvgL+UsqszlZYpJWjxgZ?=
 =?us-ascii?Q?Iz13qLMxATJl83v7UAFzS08qvAYwH3rs99ZXgA+5GYcCJdUzFh5YoAcobSEQ?=
 =?us-ascii?Q?yeY6qNTfddx60zhBpSuygqXFSIZZOkOt1Ki6x7QtBi8bppag56S962EIi6RZ?=
 =?us-ascii?Q?xkAwAO9F4b1zfcO/LNvjVGYv5CJMaJmIZc609/UcxubHWAGevcIrQTTgHaBC?=
 =?us-ascii?Q?JaeOrK1cOAeyKOkM6+X08CZLkb2zDqfvl00wtZrdOXy5tSD7f56WoW804VHx?=
 =?us-ascii?Q?Fbl30HJZqe7vsezbaiZToWEZdHktvYfn28/LDW9yX/ckCuG0QHpC1V2d1+tQ?=
 =?us-ascii?Q?0DiEHe1Ywbvym82Q7rkn9Nv/um+xfzyriikSecweGVz0VGkjvmTAQFkq8Gpf?=
 =?us-ascii?Q?mgMlH9CBkycsv61CKFZvczedwNSRpDvoOnBk07lzj3tnRVM104tVt6nJI+GE?=
 =?us-ascii?Q?1rx2sCcHTKCdr2HNZLceALz/bFZHOlZQGrVyeTn/yHxaoXTHs3NVjjjZepL8?=
 =?us-ascii?Q?omN6iRZrqpVtbUZHDBdAI0Os/n68/8985UxMB2Xize5Z25OeJYKQWsBueutV?=
 =?us-ascii?Q?GV85wUfMZKAuKV1idqMl3pNdTK7fGQStWz3GhL6buTAfmaf73/M1hiW+1PqA?=
 =?us-ascii?Q?h/mjSM7MHF3+vDzx8Tsy4DJCQC/CaQgFq2i0WoYJhsp4D5NVFVuLsdn/+BsC?=
 =?us-ascii?Q?cX/3Hqy/CUCSCaKfyH5awHGfp2lwxzmu0x+vrTMw0QevpOAo/wfyn3vFzGZ7?=
 =?us-ascii?Q?w0mb2BlA4VZCGb5zsmyxRHKxHggZXWoEoDQ3ogr5Md0C07V6azCL2TuKdjTy?=
 =?us-ascii?Q?Z2DKu7tkSBFGw2yJul9lWWIxPsmUxMZEtioqvs6+9sAvr/pm4bufa1XlwcQ4?=
 =?us-ascii?Q?mzxy4OtN3qSf+THHCe0WH07u4TM+YxXIlnv39ELLJiC6rOZ+w07xSWMiGwYw?=
 =?us-ascii?Q?xw/ZPUfpx2aH7W1WxTo3N5oH0dGRsqKmhcIDJZ2bhXfaq2qCHUO9VnQsbVKO?=
 =?us-ascii?Q?XfUOiAQAi1cqKFJtlj/5pwMTsF/bhOYSTnPcHJn79cbZ1PZ/iYvvCC3n8ZzU?=
 =?us-ascii?Q?CjoseqhbLN3Eq7C6TBAMPDgvw71tcwv3bmP/VX9B4T14FrJ+QXIELE2lZXq4?=
 =?us-ascii?Q?XeveJNaM4pPx7/jz16eMiJc23zuu9+laHspninaEZtvncfP+aa50pwPOsNJP?=
 =?us-ascii?Q?6t8kBP9UDTiTG/Ll1V0PWE2kVhHim8vt0t8IKyM0ej/95N6oTohGmQim/T54?=
 =?us-ascii?Q?CmZ1CVlPabr6d1KFN+Rcq4Jy5g+HfQLtasKrZgrB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b5cea4-2d04-4b76-c0e2-08db245bd96b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 07:15:11.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnpKXN/Ir1FHhTIYrGzY7o4tsFwzRHPS1Pzd7FZqR+CqNdFTnygGJb+jsMlvuiKzn3M3EVmB7YBbl+dlj6L6sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Oliver,

Thanks for the review.
On Mon, Mar 13, 2023 at 02:27:50PM +0100, Oliver Neukum wrote:
> On 10.03.23 05:14, Ye, Xiang wrote:
> > Hi Oliver,
> 
> Hi,
> 
> sorry for the delayed answer.
No problem.
> 
> > Thanks for your review.
> > On Thu, Mar 09, 2023 at 01:53:28PM +0100, Oliver Neukum wrote:
> > > 
> > > 
> > > On 09.03.23 08:10, Ye Xiang wrote:
> > > 
> > > > +static int ljca_stub_write(struct ljca_stub *stub, u8 cmd, const void *obuf, unsigned int obuf_len,
> > > > +			   void *ibuf, unsigned int *ibuf_len, bool wait_ack, unsigned long timeout)
> > > 
> > > Why do you make ibuf_len a pointer?
> > Because ibuf_len is also used as output of this function here.
> > It stores the actual length of ibuf receive from LJCA device.
> 
> Yes, I understand that now, thank you for the explanation, yet
> that is problematic, if we look at another issue. See further down:
> 
> > > > +		ret = -ENODEV;
> > > > +		goto error_put;
> > > > +	}
> > > > +
> > > > +	mutex_lock(&dev->mutex);
> > > > +	stub->cur_cmd = cmd;
> > > > +	stub->ipacket.ibuf = ibuf;
> > > > +	stub->ipacket.ibuf_len = ibuf_len;
> 
> Here you store the pointer into the stub. Hence we must make sure
> that the location it points to stays valid.
> 

> Now let's look at ljca_mng_reset_handshake(). I am afraid I have to quote
> its first part in full:
> 
> +static int ljca_mng_reset_handshake(struct ljca_stub *stub)
> +{
> +	struct ljca_mng_priv *priv;
> +	__le32 reset_id;
> +	__le32 reset_id_ret = 0;
> +	unsigned int ilen = sizeof(__le32);
> 
> This is on the _stack_
> Highly important !!!
> 
> +	int ret;
> +
> +	priv = ljca_priv(stub);
> +	reset_id = cpu_to_le32(priv->reset_id++);
> +	ret = ljca_stub_write(stub, LJCA_MNG_RESET_NOTIFY, &reset_id, sizeof(reset_id),
> +			      &reset_id_ret, &ilen, true, LJCA_USB_WRITE_ACK_TIMEOUT_MS);
> 
> If we run into the timeout error case, ret will be -ETIMEDOUT.
> 
> +	if (ret)
> +		return ret;
> 
> And thus here we return and free the stack _including_ "ilen", which we
> still have a pointer to. That means if the operation concludes after
> a timeout, we _will_ follow a rogue pointer.
> A couple of functions have this race condition.
Got it. Will fix that on next version.
> 
> 

Thanks
Ye Xiang

