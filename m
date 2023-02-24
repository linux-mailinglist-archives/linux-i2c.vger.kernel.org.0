Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBB76A210F
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Feb 2023 19:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjBXSCX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 13:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjBXSCW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 13:02:22 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0E2E1D924;
        Fri, 24 Feb 2023 10:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677261741; x=1708797741;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=297a3LkpgjKW/qVG4bbUaiMYbT3vv1r5gPJvA8CZM58=;
  b=a7SLjfIxWFNl/79xPBodfvm5l619SufhM4C4Dzh5IVnsrvea6iIsKifs
   0Z+E5gLXRfsFZOPtMRj+CcLglxzOcp9ZGOOXB6inTx6PKsWk0eefPHTo8
   fUvj7dYFOILPq7ol3YSxovX5MiSYVtJZ/mY08GyRSeI21U+JJfMYy4Yck
   dQXa+E2hCzawNopXJksuMmeEtT5KLsRW2RrvMazhYPS80hFI0AoSb+mMs
   whyYjgIKPY1DzGtihnh7HDH8vPoyivfnERYLiuRDhM8zgIpE/7ZBs5FMZ
   B+ub38c75WTYvSaAnxnvof5BxiX0VlYgqivJcNFCybDN3JUcYgeHwUdGC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321741126"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="321741126"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 10:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="622795384"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="622795384"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 24 Feb 2023 10:01:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 24 Feb 2023 10:01:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 24 Feb 2023 10:01:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 24 Feb 2023 10:01:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq8jFFy13EVN/6d4TAry0kcZR6C3QfIBNVRv4dDjB5PUVvP9IFebpAHH2mUSVJ6cw7x89kDhNer8DQUo/BnA7z/Vffin6P3J90x9t69fkeFb5zdK5i9gao+w6YhBc37Bjq3/zbotryc63JeCaYp0djKMih89wu60Qqq09L+ub34XVqceq0oEL6QVjAw7K0DnSZYGGiGjeWzh1mepzKRDXigjEiFo2VM854Ytback06/KuttfjG2BkyP+7OOeRLR5I2dioYgqDjjhnCcGgK6+c7URCiSwRZInYO19X6QoDDXtIbxxi6Mb5l+MPNml6EQnxjkVZ8lopSSDbTc0z+jnmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbzsY0sxqrGUTwEx5XE+siICzfL4PoJ6kP/DFPx+Z28=;
 b=bFoBGaL2AZqwArCzC57yQ7121VXRvRTTIux6BcqaodfnffmT9NSQyZWGOu/Dq1QHqtugnyJUKj56bZe+RPDNzar9i0Oox0sje4bkVYY5R9op7T7XEAFkx1OKedbh6aNLU67hJlzmy4TlIea1Gdlwd2fmqL8aoNb0fC5BokLmxBPxnqUup4o/MCLX5cB5lJVkS71mKXEGxXFCG2C1khyB2JAf1Nj17f9rilBctHnkEuwKkJX/kNOexo2qhEnIR02M0qZ/TXfNxvvAm7CA+si5I48g62K4oEEhL2qimWsZ7G2V7Ut5sjEyml4OtamIjLF0XMx0ImuAHAosm5qKYHFKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9) by
 SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21; Fri, 24 Feb 2023 18:01:31 +0000
Received: from DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1]) by DM5PR11MB1418.namprd11.prod.outlook.com
 ([fe80::7ef8:2573:5a1b:c9f1%6]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 18:01:30 +0000
Date:   Sat, 25 Feb 2023 02:01:20 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <srinivas.pandruvada@intel.com>, <heikki.krogerus@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <sakari.ailus@linux.intel.com>, <zhifeng.wang@intel.com>,
        <wentong.wu@intel.com>, <lixu.zhang@intel.com>
Subject: Re: [PATCH 5/5] Documentation: Add ABI doc for attributes of LJCA
 device
Message-ID: <Y/j7cAQaaCXXYe6s@ye-NUC7i7DNHE>
References: <20230219183059.1029525-1-xiang.ye@intel.com>
 <20230219183059.1029525-6-xiang.ye@intel.com>
 <CACRpkdbAve++nA0zwHvOm3fy0t9J9g0fR_FO71TTv=TwM6CJYA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACRpkdbAve++nA0zwHvOm3fy0t9J9g0fR_FO71TTv=TwM6CJYA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To DM5PR11MB1418.namprd11.prod.outlook.com (2603:10b6:3:8::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1418:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c8c0b7-8404-4f05-bb16-08db1691284d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 18BRWum1xcqkj/pqOjDZHkeMFiPRb3Nbpyw4lo/nGoi/MjISOXKdNJxz8gNVvd+F4c0iXjV/ocrU3HdL5Y0oHEx9h2ENq2oFz/DKswxei7CQQ7zVSGoXq2TJ++KfR7KtpspMdkUMdKZXqAM9tN0zuaCohwkO9elIYe3BoXRU1hd5LPZCHVeH/Nl5AYY0/WzFHYiaBLQ3VAdb4NmWgjYLUYXF3s6IoA9zGOEFw2myvzxpeQAzohW6KcFgusaAJ3opF+4FZcOKZDHfJwD+PE1rksLmZj+U496UrBw9TlU/F3IGSppgcbyr/qsFUqzI3J2nLr1vJHfa0m1SZIMw1AGxb+t+m6gufSiKovYG68WMewfw7PjL42j098NmVlxqveKjcKJFpqHJRfwVPMzlquD44XjabyunePeWB5pR4eDhJ4Fzzpuklk5ozDLKDiBRFh42ZU5Osiov9F/s5ZUG1v88o+erWgNZPB6CSQf3dShn53nSF/zKVU49z3QQt07d/XPEe7TEh3DJxVVk59hlkYKCINBe3+MvI35ksYzYalUDfcHfwafzjzHnJ/3GFZMBF/CG4o2oFAap5zVrAjdmkRvVhK0L3LMHQ0F8EJW0j4i+Ti8paehhpbmcabmiQSbHtSYD21uMPwu931chZ8MfHL0/yA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(396003)(346002)(39860400002)(366004)(376002)(136003)(451199018)(82960400001)(33716001)(38100700002)(6486002)(2906002)(316002)(83380400001)(53546011)(26005)(9686003)(6506007)(6666004)(186003)(6512007)(478600001)(54906003)(86362001)(41300700001)(8936002)(7416002)(4326008)(5660300002)(66476007)(8676002)(6916009)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YXOSurLEF8WdZ3PWIC1lsxh+4v+Hamc24wSgDYplXAy/vJPW/QXgQXLY1y7N?=
 =?us-ascii?Q?Rmmcfsv6yLBSP7h6MBTPDyhPvrP0+93JRWDDxsls3/8hfKBf/s1Qj0kMEw/5?=
 =?us-ascii?Q?yEwWUixlh8kNkWZrsKo9tUkM7uUF63OFY19sW/P37hndfAkhkW6QQ4xT1AKP?=
 =?us-ascii?Q?LH4L3CA/CuxDCZh5IBUUBnj2aOSdlZAG/b6goNF/kKx9PLK6IhyIlkE/bpJv?=
 =?us-ascii?Q?MFjUB8RTJc6hOJMaciHta0Ys4UlLaHVKOIkWDlkCc3tuRo0aUaq+n98dWBRm?=
 =?us-ascii?Q?pzScdt7XxQaQspkgHJA3vQzMCUuU0zPzlWNNOCxRwpzMXM3wEoRIIeoi0v79?=
 =?us-ascii?Q?G7ja4XRye8ZtueWigvR2CuYG0hMlspWkK41UFk98qoGls4y/AoVbMrpLWntu?=
 =?us-ascii?Q?szO0QIHZvlw8K63Et392Or7SAAETGY319aXBQMNWDm34pwL0I9LYcgm7yD23?=
 =?us-ascii?Q?FNI44L+Gz2EgvVGJ1k44ep1AGkqpCbV2ZiYRZuCSHK/dNuIlBYIMyeNHtMpB?=
 =?us-ascii?Q?UPriidqiy8wZ0DfJLgWdIXkBE9ih9OzO+3uYVeoQopdOEO9QyBmwfRN4GLRU?=
 =?us-ascii?Q?O68KWNf0x88l8NrEhBQlLYC7CjlEKH4fqNu112/BwrqoSL/5ai5BwYw85b8H?=
 =?us-ascii?Q?rcwK26A9Fe8z8Bxl2WRJ1j3eZng2BBA2CPqTxTk+mdbQfJ1OUNvmArmBwsi2?=
 =?us-ascii?Q?M/ZIxoD1WXeTGOJn1wHynKOHanft67NcOSPOHZh/hgUuXamGrPj/Ge419pu3?=
 =?us-ascii?Q?HfI9yqjtterC1YzqNE82JBy9l+LunojO8ew/MLlBzTktuVWq4iqPJP8qzalq?=
 =?us-ascii?Q?hho65K1Rnt/mg9BZTM306Ymeg3uOSbz+M5XHPXubvb6msoune53IiCUW3y/2?=
 =?us-ascii?Q?4UUBDId7oWC6jrBCvSDhpJDbFBacwCvz81p/LWIEpBYvFJUEZsxLAV+PX0NB?=
 =?us-ascii?Q?0FCgb9ZjVYszpsCj6WXL318LmSe3zYZPZN+0lvT3R92tSey6PIgu1CNUcwPc?=
 =?us-ascii?Q?cf6o2M9dfNkrwptQq4VeezQkO3wfnSiRgFVNPqLB6IbFkmHX2W4mVVkujsow?=
 =?us-ascii?Q?jECRs+XwIBX1AuTwPuuC6fAuzRAwfYPTz8Q8zHc0kJh0Y+tsimiZamLkK54b?=
 =?us-ascii?Q?1KRVt2a2Bu7W50Wc53sGQj0K43GG+mx0WPWp16v9uG6lt/NH7y59Xl/o1zZb?=
 =?us-ascii?Q?e8C+Dw0ymu1DKb9XHEYjAYPMUD3gNgARnNxmA/4GsZtP1q0WynJN4PVOGiNC?=
 =?us-ascii?Q?B3WJ8k/mOZLS8+JliWxuw72GALTSnTuVgT03h9hyVRc7duC7AZx2alwk6dsS?=
 =?us-ascii?Q?d43PRTFkypbgloc9DOLwe331cjMc1a58BsVhnleNRoJYqJKEwc3ovWIZBR52?=
 =?us-ascii?Q?U7Hz1RSZiwQTmBFW7yRyN+UBmqEK/ny70CEsG8oHeoZ/SMpRxl6dQBC97A51?=
 =?us-ascii?Q?hEyuodsMluKnST9oSKfg8ZuDzYBu1Ble1F/n/bgqMSVuVaO2EnJeJxqCrTCs?=
 =?us-ascii?Q?c4tYtTphr3+QlQU+f693uCMlimpN9FzU9VgrRFVAUh6ZxYHTDlIgFPmCe67a?=
 =?us-ascii?Q?73KPat4pDTTqCq0F9HMwi69uVeFliucmC24HqJPT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c8c0b7-8404-4f05-bb16-08db1691284d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 18:01:30.7496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ft6N4eOY76e3YVEiSgD1buCZ3KtN0lZR27sAwJU4ZEP09Fb7YPhztRatfCtihfrXoXmUv2l1M6MYqVZYDGolHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Walleij,

Thanks for the review.

On Fri, Feb 24, 2023 at 11:53:08AM +0100, Linus Walleij wrote:
> Hi Ye,
> 
> thanks for your patch!
> 
> On Sun, Feb 19, 2023 at 7:31 PM Ye Xiang <xiang.ye@intel.com> wrote:
> 
> > Add sysfs attributes Documentation entries for LJCA device
> >
> > Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> (...)
> > +What:          /sys/bus/usb/.../cmd
> > +Date:          July 2023
> > +KernelVersion: 6.4
> > +Contact:       Ye Xiang <xiang.ye@intel.com>
> > +Description:
> > +               Commands supported by LJCA device.
> > +               When read, it will return valid commands.
> > +               When write with a command, it will execute the command.
> > +               Valid commands are [dfu, reset, debug]
> > +               dfu:    Force LJCA device to enter DFU mode.
> > +               reset:  Trigger soft reset for LJCA device.
> > +               debug:  Enable debug logging.
> 
> Given that there are kernel drivers for this device, it looks pretty
> dangerous to make it possible for userspace to reset the device?
Agree. I would just remove the reset cmd on the next version.
User access LJCA will fail during reset because the reset cmd
could cause LJCA down for a short time.

> 
> But maybe it will re-enumerate when you do this so all drivers
> unload cleanly and then re-probe?
No, I haven't implemented the re-probe yet. It seems quite complicated to
make sure all drivers depend on LJCA re-init. So, I would just stop
exporting the reset interface to userspace.
> 
> I guess the DFU mode will use the USB standard class for updating
> the firmware?
Yes.
> 
> Perhaps a short blurb on the use case for each string could be
> helpful, like "echo dfu to this file so as to put the device into
> DFU mode so the firmware can be updated".
Thanks will add this blurb.
> 
> Is the idea that e.g. fwupdmgr should provide a front-end for this?
We haven't implemented a front-end in fwupdmgr. dfu-util is used to
update LJCA firmware manually currently. Maybe we will consider
implementing this in fwupdmgr later.
> 
> Yours,
> Linus Walleij

--
Thanks
Ye Xiang
