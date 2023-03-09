Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B566B2022
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 10:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbjCIJcl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 04:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbjCIJc2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 04:32:28 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F88DE824F;
        Thu,  9 Mar 2023 01:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678354318; x=1709890318;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=t9zUYH/XE2t0f/54S9DWgzWENXJbkHnAEE8Zlt8hjbo=;
  b=Mds04e6kH+d6CrOfqEXCgYpTtCtv2GBfYS71QwpOzI1SUdXSw2Gd/Wls
   E933590PA7mYjcamAoIGXlbELgwg5qhFcjtDpq+NGxlszHx9RMHw2DOzm
   gc4SHgH4HDpZ9fBZMxgKry55NcFQZ99wXsditi8pyAprqN4jSVWYyG1wz
   5tnmIiRcvo+unHyKI22JLmZlMSjg/J/1bPmNeSdCuN5yPhMUeelkipxAv
   px5BeTOWjOIlJkHgDRyIf1NjDrbRpICORYKEu9aSPCYeQl4Q1bky9kGER
   bPiIAGWJYSdHyrNuHzH1d0zAcEuuSa46RHshduXGhZHGg1/sfZEn4yEqC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333872429"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="333872429"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 01:31:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709776974"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; 
   d="scan'208";a="709776974"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2023 01:31:54 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Mar 2023 01:31:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 9 Mar 2023 01:31:54 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 9 Mar 2023 01:31:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHB2fttNmFfF0UsJkHV/+JIHydiYsMBxB6+LPw8EYTaDQCAVzBcMeFb205J9UjiIDc2I/QvNxzxa+lgI1MsHqn31TzUdyzd+aAIiq1l8SnEp2OjiApXt+7DSqHYTFBw4fQEIu0gEeDTBh+iQwPicHoxFe02M9kpICDI5nSbT6FaGATydlDBVspeCoEboZqsmg4R1HWXH7p3UcPzIOmpDg46Z6tsLDIUW78fUkZr2R9bWSfUSFy8tF6CmeYp/YI0Vrv6aCI4O8VKK0hOyEqM/K6QrjnDykMcymcqckRhHpQg5f5K2s/hti5uC00kgaLGfKi27pAafhHvego7mzeR+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tF0rqsNDx1vVG/7cc6PWtayvJcZYnc2MAJIMYOgXGxs=;
 b=hjrV2fnIVmaoERi4yPtqFKZ5Rb+//nvX1R5AibKG4Ldxa6NXqCYlDja2KFPGHoePc/vRipy1k5QcjW0RZwDUB75qMxRK20OElEhL7ecw4/wxhKHRX+9pP0ac0eeErArDFUB+BBBNBjVS4SNR0TK3ACACpi4RU75ttMUcYdz4aQT++Yob7NFRNSqvHyj1/rOaKAAUrwY9g7oapnqReQHQuUQg5WQdf5quQpT3a57zqHnVx5QupcXYYiFZaT2HZ2j9MlvRlPGbKTrUv9HG9NNitI8t1hHYkgtgbARK2hpSTk21gi+Tq3H9WZGALRuEye7nUibES3EnWTp3o6Pwo7FXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB1409.namprd11.prod.outlook.com (2603:10b6:404:46::19)
 by CH0PR11MB5394.namprd11.prod.outlook.com (2603:10b6:610:b9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 09:31:52 +0000
Received: from BN6PR11MB1409.namprd11.prod.outlook.com
 ([fe80::6c96:45b2:ca7c:4e79]) by BN6PR11MB1409.namprd11.prod.outlook.com
 ([fe80::6c96:45b2:ca7c:4e79%6]) with mapi id 15.20.6178.018; Thu, 9 Mar 2023
 09:31:52 +0000
Date:   Thu, 9 Mar 2023 17:31:44 +0800
From:   "Ye, Xiang" <xiang.ye@intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Lee Jones" <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
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
Message-ID: <ZAmngB84ty1flD9K@ye-NUC7i7DNHE>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <ZAmQOIh/71rY4Pa4@kroah.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZAmQOIh/71rY4Pa4@kroah.com>
X-ClientProxiedBy: SG2P153CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::7)
 To BN6PR11MB1409.namprd11.prod.outlook.com (2603:10b6:404:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB1409:EE_|CH0PR11MB5394:EE_
X-MS-Office365-Filtering-Correlation-Id: dd741366-a60e-4dee-46ef-08db20811d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UYdR7yA10CMUCfSHbqElj5dfhl/bUGpfyZLXkeyR5lHLmjbamz4NDapNnN33hTSbgvilDyUnJf1oGoy8vcwUytVKLezy9Ft+r1fsPNmsKO7uKBF6gFDWqDx3JELvkUk8Ow03JiLk16Wbv5BUJAHe7GlG15RDmU7a54nJSnS2VBx43XqncQl2AKr7Wka1W/Ja3MgtE6lnEpGOwuaOD2iUc5zCdPxXhA05oc/EWx3rIwChOiJ5xR6Qmn/G/DfiRhOS/b/qYg359qOhewCXisXoTbIEiJz5TNcRHQ5gNF80olEiJmZvyDvpZ1KBBZqD9RazxCgVob/su5X0d9czpN/cj4DkGxDajCAiyt2kQDp3OXMqTM97BKdGL0qevOYR7D2eQeUSyTC4icU4aRgRcdwFqHbLXNSN1OOUHMlw87d8qU6xCgOBonUxcWYDWwOoG6Y8y8bxeSb3pbS0y7YIqluIQPEEBZwGe+4iWkQ/zhi2qM6C/kGPp3HMuDVsinMFhOJstH7FrQHdJLfYLlJhvuIrsQyoT/I3qgpbE65KDCS0yip04Nja32r5S97oYE1HEmsMN5SJKwTOsVfcgNWVs+VAIk2z4YspdsZIm+hnmSRs+reOvwgfxCheZiBSNU0MQaKh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1409.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199018)(54906003)(38100700002)(86362001)(82960400001)(6512007)(6506007)(26005)(83380400001)(9686003)(186003)(6666004)(33716001)(316002)(5660300002)(7416002)(966005)(478600001)(6486002)(6916009)(41300700001)(4326008)(8936002)(2906002)(66946007)(66556008)(66476007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UNLWYv7X6hgbNxnJWa/ewFJYfCTNfXa3X8PbRX1dlG2XzrmQ/8OiL/7faZO3?=
 =?us-ascii?Q?FRtJBO5OJVmJvWP7b3FNC6H+EuHAQSmXw7tP0wBDoygz0PmvPEVKt5jwrufr?=
 =?us-ascii?Q?s71x32LyxbYHT/oIRWXuDHalTlmx0Vk9Mm948FnV0nI5hCKREyChv4WWAxEK?=
 =?us-ascii?Q?PddyMzfyfizdtUH6jcn/Rh7MFGY+QY4i1HdjgUOgzNsH/Ph1IpB6q5Y8H5+r?=
 =?us-ascii?Q?5gc+KJxazWSR43mt0wx2ockNqSPHpGrHYOGHMOTjesi+QDOJgYX/CNE0Dvq9?=
 =?us-ascii?Q?m37VWJUXyeEYKOOOgqgXhKvkal2JpgIrP4U28swO675Xf1gjQDryRkb+maT+?=
 =?us-ascii?Q?33le2YipJ/tqqzTmtfMAA0kTrJ4HrEOp6+3tGke3IW2SI8AdlZWGeBl7GZ5s?=
 =?us-ascii?Q?3aQaBodOgjFOiVvhkwoVRkUzBpfIqbZVQcURMYCuac3H3y4uEbNTvK2jAmnf?=
 =?us-ascii?Q?55olTzDNvaakb76d07vW02Ms97L7u1dx9o0a/fDZteU87kMGYrz2uLyrprq+?=
 =?us-ascii?Q?r0TimtSvDbjCFOgYu6vr37kpxw57Tk69pl45xHUsIb2KSWuTj03SsxbZWLat?=
 =?us-ascii?Q?MEi8kK/iB4VmkfSHfFYf5MPKiEwl+zTuEbN6AAWOc9cfFm9heGcdkfM72lst?=
 =?us-ascii?Q?cvBBfskEJsF3BfUyPzl14/Vn4YjYlVJBqs0wsgX3Y6VSag23mRuL/YkXKSUC?=
 =?us-ascii?Q?tgseaN+CmN9lQB2m+Q+qOwnVBC3+WJVotOa3Y1VEsd9vysIfJcBqj8DxvsRm?=
 =?us-ascii?Q?IKyfBPTTJDj6t0PY6U1ThmK8TKzGKud++JOcWLYtyAeB4O4xSZYbAGfx5n7D?=
 =?us-ascii?Q?O4gaYSx4SuGiCSV9unh3h8xbNxY5CssXI/NEjt6F6DqSIVT87aVIgOM8+qgS?=
 =?us-ascii?Q?gFpLlrkXDlDWRqdxY+eKzoWd5c/KTB1ow300rXP3neMcUkm3tCDUDRNI50LN?=
 =?us-ascii?Q?cyOVwNFa9Oaswt5CmlAnpEikIQyQx+Jr0Hbr4L1GQx/NcCpQ/kipu2OjNsfk?=
 =?us-ascii?Q?CYqpliM4k5TrGCCegr+VwBx76YU9vYF9GgYztKUMYR+XhN6iwSyhCd1AKNYR?=
 =?us-ascii?Q?0QAjfyrSPK7WmzREHKVuThsh60dURC0OVKpFXq+DNyHW+rWXzDryJt/bU9T+?=
 =?us-ascii?Q?Ug3diWLCaGt41ZOjhiWNJpQ4KT2SQWi9VFaxaNOgOAkEpY4UPGJdBPyUfFY6?=
 =?us-ascii?Q?jV+1RvTzoVDFlBczydeVSBQ1mRzb/zMJFzfKrEXjq1MYaRQblLY1D+AxDAif?=
 =?us-ascii?Q?M87f45H9K+kU1l2cr8cx0s7VBfzCmlyMrpZAVXd0l2flPQQr8Tp5r05MF815?=
 =?us-ascii?Q?QBXQ1XTF/timUM8bVOX4rQweaafGcaymYZlm3RARB0sGhEzgKycwPzr8lSO4?=
 =?us-ascii?Q?uhOUHeDR+n8mYsIGQ1C+pw8VO6Nd93IIgTu3YBMxcwKcmTpBUesqHlXJ2gMR?=
 =?us-ascii?Q?lXFjmov37y/cIqk+a8H+7FVFAVA8aTTV/0FVTlDAX8cD96gSS4bv9l5m0+MK?=
 =?us-ascii?Q?PlRA4yChxqfE5Mr6+rzOf3bRKsk7QIU0adcrltbaDYlwRJN/mb9IBRRQIERm?=
 =?us-ascii?Q?yTLdTRP0XZKDZ+EkaQk8cVtw1e6ApjKOdYr4LEIb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd741366-a60e-4dee-46ef-08db20811d94
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:31:52.4215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1Q3IlX/SOzHXUQAIQfjPK8OjaA5dLbC/uZntldBOGVSc5s9+R6ZiLIuYPrlWm7ENMFUVV7qZE111SAUnFelVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5394
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 08:52:24AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 09, 2023 at 03:10:56PM +0800, Ye Xiang wrote:
> > +static int ljca_mng_get_version(struct ljca_stub *stub, char *buf)
> > +{
> > +	struct fw_version version = {};
> > +	unsigned int len = sizeof(version);
> > +	int ret;
> > +
> > +	ret = ljca_stub_write(stub, LJCA_MNG_GET_VERSION, NULL, 0, &version, &len, true,
> > +			      LJCA_USB_WRITE_ACK_TIMEOUT_MS);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (len != sizeof(version)) {
> > +		dev_err(&stub->intf->dev, "get version failed, len:%d\n", len);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return sysfs_emit(buf, "%d.%d.%d.%d\n", version.major, version.minor,
> > +			  le16_to_cpu(version.patch), le16_to_cpu(version.build));
> > +}
> 
> You have sysfs files, yet no Documentation/ABI/ entries?  That's not
> allowed, you know this :(
The Documentation/ABI/ entries is added for the sysfs on patch 5 of this series.
https://patchwork.kernel.org/project/linux-usb/patch/20230309071100.2856899-6-xiang.ye@intel.com/
> 
> > +static ssize_t cmd_store(struct device *dev, struct device_attribute *attr, const char *buf,
> > +			 size_t count)
> > +{
> > +	struct usb_interface *intf = to_usb_interface(dev);
> > +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> > +	struct ljca_stub *mng_stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
> > +	struct ljca_stub *diag_stub = ljca_stub_find(ljca_dev, LJCA_DIAG_STUB);
> > +
> > +	if (sysfs_streq(buf, "dfu"))
> > +		ljca_mng_set_dfu_mode(mng_stub);
> > +	else if (sysfs_streq(buf, "debug"))
> > +		ljca_diag_set_trace_level(diag_stub, 3);
> 
> Sorry, but no, you can't do this in a sysfs file.
Do you mean that we can't use sysfs to send "debug" command to device?
Could you provide some detail or hints?
> 
> > +
> > +	return count;
> > +}
> > +
> > +static ssize_t cmd_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	return sysfs_emit(buf, "%s\n", "supported cmd: [dfu, debug]");
> 
> sysfs files do not show "help text".
Ok. I can remove this for this has been described in
Documentation/ABI/testing/sysfs-bus-usb-devices-ljca (added in patch 5
of this series).
> 
> thanks,
> 
> greg k-h

--
Thanks
Ye Xiang
