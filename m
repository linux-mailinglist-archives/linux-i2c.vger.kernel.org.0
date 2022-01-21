Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A95496408
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jan 2022 18:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbiAURiW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 Jan 2022 12:38:22 -0500
Received: from mail-dm6nam12on2072.outbound.protection.outlook.com ([40.107.243.72]:30798
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235773AbiAURiV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 Jan 2022 12:38:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijj3HwOFwP9NFHcFXU5dfxEpk3S/89Lsh2p5GWoRAD1GMXf8RBo3ZeY5wm31oZYScu5kFjiJ8pYgOogXqp/IIFs7cGVeX4syCyp7iyKtY7Z0rxTJlgksEztgW/BZQ1gIt9SVyuq+oZ7DCfKUgNuygfG82ktqyzTIPxrTss75YsGaseUR2nyIhiSkhS5Gz0gQGLUR7wYQGpe6TcVsud2vcokJaJSceXwBWbuS2j0ws8qUXVVP87JdPHjbShx0TdU6Xihw1T7P54xPl/3jefjgoP+UQGz8o2RP73X0Iz+GrAgWe9Suo5/PGZzF2bFK7j5GWVBv10FwdmO7BfbkxJsT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/c1nCui+PssoZIfSJVuO5DGzHV7xFHFl7vkNqbYo3E=;
 b=kF10kFSpoO++MweQRO+A3EK6KI5M1nuaENOyhT8pDPsAgEFKjgSWJbEIs+1W/u/Ec4quYLJeeR87lrqjiBu0Zk2hcHhlAcsbpqZwBR4elZJzva1wb2o9JwMAUFoPiM65Dt8xQkQyCO+fNJtXcogCDWnbrdHiW4zI6AjCkhuqgKgLen1oIWng02GADlI6l87ArsmNHs4F5Wy10fcWACjBDq3xm5i20SpCnEzntJhfbM8kVTpki6wqmnwwfaYEHJm+b2Jgojcn9+kpRbPnvHAOe29b2OyQsXRZKNpmAF4yz3J40uantaVZ3x78nI56QRRIDBebjYjxjZfOoJFI9KxB9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/c1nCui+PssoZIfSJVuO5DGzHV7xFHFl7vkNqbYo3E=;
 b=3m7HEqLYe1Vg1gFrJpj6ho0jbhb/simevCGQ498BVUr6Q+Jp9vs0G1+g8coi1jOzApYQQJRuMem7HrCHNmw3M7UN5oNCfYbGiSpSoKbPjNCCe7xcI7QmhE3H4dVpdwElvCx9w13KCo5TtC2EYC0BVxH02dg0xJGIpd2nTtsgiA8=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MN2PR12MB3469.namprd12.prod.outlook.com (2603:10b6:208:ca::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 17:38:14 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::42f:534d:e82:b59f%6]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 17:38:14 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        =?iso-8859-2?Q?Jan_D=B1bro=B6?= <jsd@semihalf.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>,
        "upstream@semihalf.com" <upstream@semihalf.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>
Subject: RE: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Thread-Topic: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Thread-Index: AQHYDq3Wf7J+XDZDS0q63HnDx9C6raxtRv0AgAB1P8A=
Date:   Fri, 21 Jan 2022 17:38:14 +0000
Message-ID: <BL1PR12MB5157C8952EF693A93785FBD2E25B9@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220120001621.705352-1-jsd@semihalf.com>
 <20220120001621.705352-3-jsd@semihalf.com>
 <a6e0fc62-4a2e-cd2b-557f-5e86088aeeb7@redhat.com>
 <CAOtMz3NcMZsCMO+15wzzwvF44PqRmem1eP-rCbb+dCiaWiGKzA@mail.gmail.com>
 <b30a212f-643d-c85d-6301-d92ee0adf098@redhat.com>
In-Reply-To: <b30a212f-643d-c85d-6301-d92ee0adf098@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-21T17:36:07Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=af6aa3d3-b260-4870-a9eb-ad9fb870c39e;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-01-21T17:38:10Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: c0461337-8e25-44fa-af3f-a9e2df2796b1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4baa0e16-9279-4841-0ec6-08d9dd04cd3f
x-ms-traffictypediagnostic: MN2PR12MB3469:EE_
x-microsoft-antispam-prvs: <MN2PR12MB34695FE21E83363F761D6E7CE25B9@MN2PR12MB3469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vg7nmA4p1kB2YB2T2v2obZE/w3RNF8lVXoBOcV7moC7td0z3qs/1J3edoZXPP6gHeCjIedwx/nLFHZRUSN2mKx+9qiEuJzha5DtvWjqtfjdhdOMiBHyedq7jyrzcWPTSb8220gp/uve1ecXrB0G6ch3/cukZAqqjwnSZIvXRNZVeF2oLbie1yb/K/uqsBNWonq35HCuPwzdf8vYU7dthMNf+OrkwDSBRhuN87ZGUAa7smQmo4fcEFm8AdgtrkuG8ZpkeWi9zXSbEzqSeMbIuytJnOBSDwYhEtQH60oSuEGsZXRW2oKVGgrPWR0tY+jw/dOc/OQlyy7//wDrDFlBfxoILeBNQiC8QB9V7K8t0jrLYuuJGroL1g8VvxFzUhWoTdKSQ/K37kQkdDP0Y7hIG2g8P6LTUz2lMY/Lncdi0GsOFCmT7gYKCeIzbdt6KIzcvtVY685HT+/zsJXd86DwcaSjwaqkAAJO8cCS/2j5jH9iaTeSc/u5P/OnnZPC9rGdhRNz3pVNky9NaqFW5/4JNUvDO1o4WcglGptwQHGh2MU4hynW/kMEyJskp476saiEzlauI1n92Qt2eSk1WP7T+MJN/+EIJ8CSPYl71jyDsFcEgipkbYx5Oun2Gz48RUfdswjKG+qg50LW5PPvbHTLEN9pQawYDRf6t7bgCo0Vj1825ZG61QqvLstbMjo9YDisanp4FBes/oOwn8TXT+TMs9oqKCMTjV3wFGQkNUMinZHOWSLUwVLzdSWHJzRuUyD7qSiMVRuPbggSMpQyxwXPEnGvK8wNTeGzPTx4unmRzDwKKI7GdE8d4gJvRg8SW1zdT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8936002)(86362001)(9686003)(66574015)(966005)(83380400001)(8676002)(316002)(110136005)(55016003)(30864003)(5660300002)(52536014)(54906003)(66476007)(66556008)(64756008)(66446008)(53546011)(66946007)(26005)(6506007)(71200400001)(186003)(76116006)(38070700005)(2906002)(508600001)(45080400002)(33656002)(38100700002)(122000001)(7696005)(7416002)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?EiuWpHjZOJmM77jX7fMQYWZ/+Mv1nxi74NHlLyF9Q5FpTP4DtEHRS7GQbL?=
 =?iso-8859-2?Q?6t6YbhwuKWox+Qr+Bdp3yyojl7tehMw/3uG/0wjKwbS66qaOb0RrA+7EYQ?=
 =?iso-8859-2?Q?4qBVkwXmj7BEsaNELM6oF+2WTkbD+LVug9THG31uQXa1k2xDl7AH2dFQTC?=
 =?iso-8859-2?Q?UUwkF1Rm9BnR9/MCn4ESi0MfqsF4UJsmGWUMFU8GtbQqV1XwiI3tuSccqg?=
 =?iso-8859-2?Q?WnB9I0JUddBPc1obG5+TB2dt+YyLgxn55uYs+R6F/1XKQ92cfHcYBenHJh?=
 =?iso-8859-2?Q?1Xz370KlOTJ87eNrgcyKllORcNkw4y263v4vxaWXq1c64YCnO0VW68aEUs?=
 =?iso-8859-2?Q?bfhE6pUEipP8ZiYn9aDQW+B+knejOOtB+gjnafWmq3cTnL8Z5Saw8nzKsy?=
 =?iso-8859-2?Q?GgNwsSTzSCct0Z75xQ8XSW93SjGzp35HW6Qwvfw3oPRNeBcTWBdriDnG8x?=
 =?iso-8859-2?Q?KGbdeTrM019ssBdQiymsIZul6Gr6B6CKIeW02nHC/wFS8pku81tIZjzRze?=
 =?iso-8859-2?Q?nwUSADuLoxYhCuh4tMRIC05HhuL8GFtQoPk74YkvBRAB0NEIGPZqSxJCxF?=
 =?iso-8859-2?Q?AYoLo64Efp0k06nQ1uMmET+bor67+XDMudn644bYkM6u5oD88HWPWaIhfU?=
 =?iso-8859-2?Q?OQyErzrjiXTzEwMuvlre95+i/tvOeDDZ7CHyw6sjNSO12dN4MTQXBRAy1H?=
 =?iso-8859-2?Q?f6BhOWeyZWJ9VFDv5Aw1Scvxra4gHAzub/5Ly45qmvFrCR3n9RKuKE8WZ8?=
 =?iso-8859-2?Q?J/YAsydb3FmHk2t6EXeCRz8sRZNXWljIIqp7kW01DNEdqaFfWBSJiUEt3c?=
 =?iso-8859-2?Q?VTTZi6YkKGkFCDbmFIflsvv7j24wBHWPTFkrdqS3bTdFEkkKJo6G3g+tYr?=
 =?iso-8859-2?Q?kyTZFldypXzebqon+OyI4W+6izX+Y/asW8t3dm5LFoBchFD0cejkfeveA0?=
 =?iso-8859-2?Q?C58KEhYfDhEtnYLoLE1/lOGezqyc7K8/s7XuFEURjnJWGdyDPqST2j/vCr?=
 =?iso-8859-2?Q?/2idr7CF94bJ/S9akswfeTMDKZ9kHxs46EM8Yvapyz/lFqClV2Giadn7pm?=
 =?iso-8859-2?Q?zaFCvWeiouWyQ6j7lGD2fprcwtSnRsaG3/yRoWpoeIFmGQugZ16FcXuX8j?=
 =?iso-8859-2?Q?nKWiYYpmrwN0NmR+yjTLKqRYMQMlenBtg1YNIKdgN+eVeZiFdFYWkd1tnE?=
 =?iso-8859-2?Q?joWPtsk3PJtGv24PcgbjHxknKhWq/BZYh/HlhpS4FeL6dfMaOXOfDjAzqZ?=
 =?iso-8859-2?Q?JCyxh+Ozi/H8iEZ76Saj5dMBPITGiqOJd/PO7qa/39LxR/0jp61+VlK10V?=
 =?iso-8859-2?Q?andT+trRXsxGV/C+SReLLv7zGKANuojhIVyh9XpyJ4x+/kJdJfWsB+dx4A?=
 =?iso-8859-2?Q?BT2/KGNyGNvPAqD0Tk1CmZj8AAPIkwF2gdVAOYfEUulnFTTMkTG95DBv0o?=
 =?iso-8859-2?Q?+EYmt5iovmZBaAeRLKHZPGFU2Tgo/DCpv+5CbcWzZuqZmMaMdQ+Ml3X+It?=
 =?iso-8859-2?Q?Lp8Fkd4LdntpwbmwXqgtFooEaD3taoAjTixFPBK6Y9K/urWjvnzG6zbbF+?=
 =?iso-8859-2?Q?LevsO5awfbbe3DodA+jcU0pDVzGpPn5GuROaazCD7MyuKLkijqvSjbR4Qt?=
 =?iso-8859-2?Q?ALZR1bkPDGi+1L2l+a6xbMY/JqnNoRI34tAaXlK7kbZewsht3DEvt53+Wu?=
 =?iso-8859-2?Q?jjlBPhQQYF1f0m2zy64=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4baa0e16-9279-4841-0ec6-08d9dd04cd3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 17:38:14.1768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: exmtsLdY3DD5yJYyBDSkJPIqCUvMLAhzFOb+MskkjFd+vmmJGYDj0zeQIvDr0jbuUb/6YHGlAuEiv04FUhEKoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3469
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Public]

+Thomas (ccp driver)
+Alex (amdgpu driver)

>=20
> On 1/21/22 10:59, Jan D=B1bro=B6 wrote:
> > (...)
> >
> >>> --- /dev/null
> >>> +++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
> >>> @@ -0,0 +1,357 @@
> >>> +// SPDX-License-Identifier: GPL-2.0
> >>> +
> >>> +#include <asm/msr.h>
> >>> +#include <linux/i2c.h>
> >>> +#include <linux/psp-sev.h>
> >>> +
> >>> +#include "i2c-designware-core.h"
> >>
> >> So all the stuff starting here:
> >>
> >>> +
> >>> +#define MSR_AMD_PSP_ADDR     0xc00110a2
> >>> +#define PSP_MBOX_OFFSET              0x10570
> >>> +#define PSP_CMD_TIMEOUT_MS   500
> >>> +
> >>> +#define PSP_I2C_REQ_BUS_CMD          0x64
> >>> +#define PSP_I2C_REQ_RETRY_CNT                10
> >>> +#define PSP_I2C_REQ_RETRY_DELAY_MSEC 50
> >>> +#define PSP_I2C_REQ_STS_OK           0x0
> >>> +#define PSP_I2C_REQ_STS_BUS_BUSY     0x1
> >>> +#define PSP_I2C_REQ_STS_INV_PARAM    0x3
> >>> +
> >>> +union psp_req_buffer_hdr {
> >>> +     struct {
> >>> +             u32 total_size;
> >>> +             u32 status;
> >>> +     } __packed;
> >>> +     u64 hdr_val;
> >>> +};
> >>> +
> >>> +enum psp_i2c_req_type {
> >>> +     PSP_I2C_REQ_ACQUIRE,
> >>> +     PSP_I2C_REQ_RELEASE,
> >>> +     PSP_I2C_REQ_MAX,
> >>> +};
> >>> +
> >>> +struct psp_i2c_req {
> >>> +     union psp_req_buffer_hdr hdr;
> >>> +     enum psp_i2c_req_type type;
> >>> +} __packed __aligned(32);
> >>> +
> >>> +union psp_mbox_cmd_reg {
> >>> +     struct psp_mbox_cmd_fields {
> >>> +             u16 mbox_status;
> >>> +             u8 mbox_cmd;
> >>> +             u8 reserved:6;
> >>> +             u8 recovery:1;
> >>> +             u8 ready:1;
> >>> +     } __packed fields;
> >>> +     u32 val;
> >>> +};
> >>> +
> >>> +struct psp_mbox {
> >>> +     union psp_mbox_cmd_reg fields;
> >>> +     uintptr_t i2c_req_addr;
> >>> +} __packed;
> >>> +
> >>> +static DEFINE_MUTEX(psp_i2c_access_mutex);
> >>> +static unsigned long psp_i2c_sem_acquired;
> >>> +static void __iomem *mbox_iomem;
> >>> +static u32 psp_i2c_access_count;
> >>> +static bool psp_i2c_mbox_fail;
> >>> +static struct device *psp_i2c_dev;
> >>> +
> >>> +static int psp_get_mbox_addr(unsigned long *mbox_addr)
> >>> +{
> >>> +     unsigned long long psp_mmio;
> >>> +
> >>> +     if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
> >>> +             return -EIO;
> >>> +
> >>> +     *mbox_addr =3D (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int psp_mbox_probe(void)
> >>> +{
> >>> +     unsigned long mbox_addr;
> >>> +
> >>> +     if (psp_get_mbox_addr(&mbox_addr))
> >>> +             return -1;
> >>> +
> >>> +     mbox_iomem =3D ioremap(mbox_addr, sizeof(struct psp_mbox));
> >>> +     if (!mbox_iomem)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +/* Recovery field should be equal 0 to start sending commands */
> >>> +static int psp_check_mbox_recovery(struct psp_mbox *mbox)
> >>> +{
> >>> +     union psp_mbox_cmd_reg tmp =3D {0};
> >>> +
> >>> +     tmp.val =3D readl(&mbox->fields.val);
> >>> +     return !!tmp.fields.recovery;
> >>> +}
> >>> +
> >>> +static int psp_wait_cmd(struct psp_mbox *mbox)
> >>> +{
> >>> +     union psp_mbox_cmd_reg expected =3D { .val =3D 0 };
> >>> +     u32 tmp;
> >>> +
> >>> +     /* Expect mbox_cmd to be cleared and ready bit to be set by PSP=
 */
> >>> +     expected.fields.ready =3D 1;
> >>> +
> >>> +     return readl_poll_timeout(&mbox->fields.val, tmp, (tmp =3D=3D
> expected.val),
> >>> +                               0, 1000 * PSP_CMD_TIMEOUT_MS);
> >>> +}
> >>> +
> >>> +/* Status equal to 0 means that PSP succeed processing command */
> >>> +static int psp_check_mbox_sts(struct psp_mbox *mbox)
> >>> +{
> >>> +     union psp_mbox_cmd_reg cmd_reg =3D {0};
> >>> +
> >>> +     cmd_reg.val =3D readl(&mbox->fields.val);
> >>> +     return cmd_reg.fields.mbox_status;
> >>> +}
> >>> +
> >>> +static int psp_send_cmd(struct psp_i2c_req *req)
> >>> +{
> >>> +     struct psp_mbox *mbox =3D (struct psp_mbox *)mbox_iomem;
> >>> +     union psp_mbox_cmd_reg cmd_reg =3D {0};
> >>> +
> >>> +     if (psp_check_mbox_recovery(mbox))
> >>> +             return -EIO;
> >>> +
> >>> +     if (psp_wait_cmd(mbox))
> >>> +             return -EBUSY;
> >>> +
> >>> +     /* Fill address of command-response buffer */
> >>> +     writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
> >>> +
> >>> +     /* Write command register to trigger processing */
> >>> +     cmd_reg.fields.mbox_cmd =3D PSP_I2C_REQ_BUS_CMD;
> >>> +     writel(cmd_reg.val, &mbox->fields.val);
> >>> +
> >>> +     if (psp_wait_cmd(mbox))
> >>> +             return -ETIMEDOUT;
> >>> +
> >>> +     if (psp_check_mbox_sts(mbox))
> >>> +             return -EIO;
> >>> +
> >>> +     return 0;
> >>> +}
> >>
> >> Through here seems to all be generic code for accessing
> >> the AMD PSP. To me this seems like something which belongs
> >> in a separate AMD-PSP-mbox driver/lib, which can then be
> >> shared between other kernel drivers which may also want
> >> to access PSP.
> >
> > I see your point clearly and actually it is not an accident that I've
> > put all PSP-mailbox methods in one "block". They are logically
> > different than the rest of i2c-adapter specific methods.
> >
> > That being said, above PSP mailbox was created by AMD solely for the
> > purpose of i2c_arbitration. It has its own set of commands and
> > specific format of the command-response buffer. Thus it is not and it
> > won't be generic in the future. There are already upstreamed drivers
> > from AMD (under drivers/crypto/ccp/) which made use of PSP, however
> > their channel of communication looks completely different than the
> > very simple i2c_arbitration model implemented above.
> >

Can you please double confirm no other users for this mailbox and it's for
you only?  And if so is it only specific to this platform that no other use=
rs?=20
At least on some UEFI AMD platforms that mailbox is defined for
communication with something else.  We might need some way to attest
from the firmware that it's safe to use.

The only mailbox that is defined for OS use across different silicon AFAIK =
is
the GPU driver mailbox.  It may be safer to use that, but I'm not sure if
GPU driver has come up early enough for your use.

> > Because of this I'm treating this as an i2c_semaphore-related code and
> > putting this in this module. In my opinion moving this into some
> > separate driver (which will be actually used only here) makes code
> > less clear. But let's also hear some voice from AMD.
>=20
> Since as you say this mailbox is special and only for i2c-arbitration,
> keeping it inside this patch / .c file is fine.
>=20
> >
> >>
> >> Sorta like the generic iosf_mbi_read() and
> >> iosf_mbi_write() functions from:
> >>
> >> arch/x86/platform/intel/iosf_mbi.c
> >>
> >> used on the Intel chips, which are also used outside of
> >> the I2C bus-locking code.
> >>
> >> This is also one of the reasons why I think it would be
> >> good to get some AMD folks involved in this, since they
> >> may be aware of other drivers which also need to access
> >> the PSP mbox.
> >>
> >
> > Right, I'm adding mario.limonciello@amd.com to the CC, so that he can
> comment.
> >
> > (...)
> >
> >>> +/*
> >>> + * Locking methods are based on the default implementation from
> >>> + * drivers/i2c/i2c-core.base.c, but with psp acquire and release ope=
rations
> >>> + * added. With this in place we can ensure that i2c clients on the b=
us shared
> >>> + * with psp are able to lock HW access to the bus for arbitrary numb=
er of
> >>> + * operations - that is e.g. write-wait-read.
> >>> + */
> >>> +static void i2c_adapter_dw_psp_lock_bus(struct i2c_adapter *adapter,
> >>> +                                     unsigned int flags)
> >>> +{
> >>> +     psp_acquire_i2c_bus();
> >>> +     rt_mutex_lock_nested(&adapter->bus_lock,
> i2c_adapter_depth(adapter));
> >>
> >> This does not do what you think it does and you will still deadlock
> >> when things nest because of someone taking the bus-lock and then
> >> the main i2c-designware transfer function calling the acquire_lock
> >> callback.
> >
> > I haven't used rt_mutex_lock_nested() with the intent to prevent me
> > from deadlock when i2c-designware calls acquire_lock with bus-lock
> > already taken. This is a method copied from
> > drivers/i2c/i2c-core-base.c (BTW, I have a typo in above comment).
> > This is the default implementation applied by i2c-core when particular
> > adapter doesn't register its own locking callbacks - thus it is called
> > for i2c-designware for all platforms.
> >
> > In case of this driver internal i2c-designware acquire_lock() is equal
> > to psp_acquire_i2c_bus(). In other words, bus-level lock
> > i2c_adapter_dw_psp_lock_bus() is a superset of internal adapter's
> > acquire_lock().
>=20
> Ah I missed that this is just mimicking the core functions +
> an extra call to psp_acquire_i2c_bus().
>=20
> I assumed that the dwc->acquire callback path was also taking
> the mutex and I thought you had fallen for the _nested meaning
> something different then it does, my bad.
>=20
> > In order to prevent deadlock which you are talking about, I'm using
> > reference lock counter inside psp_acquire_i2c_bus() thus it is safe to
> > invoke acquire_lock() when bus-lock is already taken.
>=20
> Ah good, that is pretty much is the same as what the Bay Trail code
> is doing.
>=20
> >
> >>
> >> The _nested postfix is only for the lockdep lock-debugger, this
> >> actually turns into a regular mutex_lock when lockdep is not enabled:
> >>
> >> #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >> extern void rt_mutex_lock_nested(struct rt_mutex *lock, unsigned int
> subclass);
> >> #define rt_mutex_lock(lock) rt_mutex_lock_nested(lock, 0)
> >> #else
> >> extern void rt_mutex_lock(struct rt_mutex *lock);
> >> #define rt_mutex_lock_nested(lock, subclass) rt_mutex_lock(lock)
> >> #endif
> >>
> >> The _nested postfix as such is only to tell the lockdep code that
> >> even though it seems we are trying to take the same mutex twice
> >> since in both cases it is of i2c_adapter.rt_mutex "lock class"
> >> that we are sure it is never the same i2c_adapter (but rather
> >> one which always gets called in a nested fashion from another
> >> i2c_adapter).
> >>
> >> IOW this only disables a false-positive lockdep warning, it does
> >> not allow taking the same mutex twice, you will still hang on
> >> the second mutex_lock call on the same lock.
> >
> > Thanks for the technical background about rt_mutex_lock_nested. I
> > think we should keep using it as is, since as I wrote above I don't
> > have any reasoning to modify it here.
>=20
> Ack, now that my misreading of the code has been cleared up
> I agree.
>=20
> >> Also I don't think you are allowed to use the bus_locking code
> >> like this. The i2c bus-locking code is intended to deal with
> >> busses which have muxes in them, where the mux must be set
> >> to the right branch of the bus to reach the client and then
> >> not be changed during the transfer to that client.
> >>
> >> So i2c-client drivers are never supposed to directly call
> >> the bus-locking functions.
> >
> > I think you are not correct here. There are examples of i2c-clients
> > which are using i2c bus_locking for the purpose of locking adapter for
> > the bunch of i2c transactions.
> >
> > As an example let's take drivers/char/tpm/tpm_tis_i2c_cr50.c. It
> > operates in write-wait-read model and there is i2c_lock_bus() call
> > used to ensure that bus won't be released -
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.c
> om%2Ftorvalds%2Flinux%2Fblob%2Fmaster%2Fdrivers%2Fchar%2Ftpm%2Ftpm_
> tis_i2c_cr50.c%23L202&amp;data=3D04%7C01%7Cmario.limonciello%40amd.com
> %7C1bdc742bc2a24f59b7d908d9dcc95438%7C3dd8961fe4884e608e11a82d994
> e183d%7C0%7C0%7C637783579554955840%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 3000&amp;sdata=3Dfr0UEka%2BxYyPxqUG6oOZo%2Bc6pWgto2mD7hWA20YulVQ
> %3D&amp;reserved=3D0.
> >
> > Similar model is followed in drivers/char/tpm/tpm_i2c_infineon.c and
> > couple of other i2c-client drivers.
>=20
> Ah I see, interesting (live and learn).
>=20
> But this is then combined with using the special __i2c_transfer()
> function for the actual i2c reads/writes, since using the regular
> i2c_transfer() function after already taking the lock would deadlock.
>=20
> There is a similar unlocked raw __i2c_smbus_xfer(), but as the
> comment in include/linux/i2c.h above the locked i2c_smbus_xfer() says:
>=20
> /* This is the very generalized SMBus access routine. You probably do not
>    want to use this, though; one of the functions below may be much easie=
r,
>    and probably just as fast.
>    Note that we use i2c_adapter here, because you do not need a specific
>    smbus adapter to call this function. */
> s32 i2c_smbus_xfer(...);
>=20
> So in this case a driver cannot use the usual
> i2c_smbus_read_byte/word/byte_data/word_data() helpers and
> the same for writes. Also using an i2c_regmap (which is used
> in a ton of places like PMIC drivers) will not work this way.
>=20
> So yes you can use i2c_bus_lock() for this; but only if all the
> drivers where you want to do that limit themselves to
> __i2c_transfer() and __i2c_smbus_xfer() calls and/or are
> rewritten to only use those.
> >> This is why in the Bay Trail case we have i2c-drivers
> >> directly calling iosf_mbi_block_punit_i2c_access() and
> >> iosf_mbi_unblock_punit_i2c_access() to lock the bus
> >> for multiple i2c-transfers. We can get away with this there
> >> because the bus in question is only used to access the
> >> PMIC and that PMIC is only used on Bay Trail (and CHT)
> >> boards, so the PMIC drivers can just hard-code these
> >> calls.
> >>
> >> If you need to take the PSP I2C semaphore for multiple
> >> transfers in some generic drivers, then I guess that the
> >> i2c-subsys will need to get some new i2c_adapter callbacks
> >> to acquire / release the bus for i2c-controllers where
> >> the bus/controller is shared with some co-processor like
> >> in the PSP case.
> >
> > This is exactly my intention to support generic i2c-clients drivers
> > without them being aware that i2c-adapter above is using some
> > semaphore/arbitration. Hopefully you can agree with me that currently
> > available bus_locking can be used and is enough for this purpose.
>=20
> It can be used, but with limitations, see above.
>=20
> >
> >> Also note that iosf_mbi_block_punit_i2c_access() and
> >> iosf_mbi_unblock_punit_i2c_access() do their own
> >> ref/lock-counting to allow calling them multiple times and
> >> the first block call takes the bus and the last unblock
> >> call releases it.
> >
> > This is exactly what I was talking about above and also implemented
> > within psp_acquire_i2c_bus() and psp_release_i2c_bus().
>=20
> Right, I was to quick in skimming over your code when
> I wrote down my concerns about there being a deadlock
> there, sorry.
>=20
> Regards,
>=20
> Hans
