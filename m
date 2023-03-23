Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B54D16C6986
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 14:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbjCWNcH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 09:32:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbjCWNcG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 09:32:06 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2102265A4;
        Thu, 23 Mar 2023 06:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8vGP1NnKw3ZD89V0bUIUakRNQOEJwcWTjkgs8CWsJK9b77oVR1tw8oQpKae7t/tzlDvDArw+my0L66aNq2V8lgyy3DCJQN1w1zswpAi/YKty9ffn+4CZH6PMl3BCg6qD9YjJc1gqtrWjEhQgkvDICB9sYpHIrPpVYT1thg6Co1j7hF29kiKGJaULt2V+9N428dEV/dawHY+eezlr16k7+qiF6wW62CRh2jWz6IbMINdtfpVHJEzcJmmbdAv5/F8SOr25d01zcl+yPm2T55bNr8TF+BXsQAj6B6eyVa1CVauMnVwq/eanW8pFx+LXH1N+iH+hOQerwH/WPhROeG99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVpb6RDzdFywZeWR+nDntq53D5pQGOko46DMqPTlvbQ=;
 b=Liw5FMY2adc/GWbk0k5DY0kOgKALtfJYJ27zF2IVDAuyRD6yzEUE59zSzujx6NJ8lRj3wA6nqfSEWiCpfmlgDDP1+sayyiHpUBrGkrXyAZv/rBvR3l9IFZMfTwAbxScDGIyG90BSePe5EFjiI2w8T8Y+o39zerdxy6/42M/B29zlZsMxFCSjVKMfnzZPMN/EUWpPVeXp1GLkr9sEzcn/ud3+4iDy3SAd62Z7hi8hs/GGrRAr4kwhPkVJSo52VkTGn1MgpQHDsVNXri6N1gacmo4MG7fFecrMrQ3uAti87xdiQamWDMUoBWS9b9xLoSp36FZzi1QdceEtnB48ShgkWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVpb6RDzdFywZeWR+nDntq53D5pQGOko46DMqPTlvbQ=;
 b=rU4UIeqxiYsDAtT4cqHMYXf3HDaQ+JVdBu3TRkp6Rh0Qwpy0a7cQ68IK/hi6JrUadFUEF/bGKbsRbmmG/A9w3Gzwhl9TmQqQTy1BXJlOPSL6gU1xuytJPH+8g9+P68RZeZISm1WhIWPW3YA6yerxkQJjQQAM7PqLK86zMM9mjOo=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6550.namprd12.prod.outlook.com (2603:10b6:930:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:32:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a4e:62dd:d463:5614%9]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 13:32:01 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     =?iso-8859-2?Q?Jan_D=B1bro=B6?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 4/4] i2c: designware: Add doorbell support for
 Mendocino
Thread-Topic: [PATCH v6 4/4] i2c: designware: Add doorbell support for
 Mendocino
Thread-Index: AQHZXQIIuegHdzU3/kyhZjCumBVofq8IVnSAgAAHD+A=
Date:   Thu, 23 Mar 2023 13:32:01 +0000
Message-ID: <MN0PR12MB61010E4D635FB23135EFAD59E2879@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <20230322210227.464-1-mario.limonciello@amd.com>
 <20230322210227.464-5-mario.limonciello@amd.com>
 <ZBxOwTggrZTvJf2H@smile.fi.intel.com>
In-Reply-To: <ZBxOwTggrZTvJf2H@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-03-23T13:32:00Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=45498d36-57ef-43f5-b6a4-9e76c2f09853;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-03-23T13:32:00Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: c76a7e63-c619-4e70-accc-90adbebd2a06
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CY5PR12MB6550:EE_
x-ms-office365-filtering-correlation-id: d7593f8e-98fc-4b87-3bb8-08db2ba2fc35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rB646sV0ZvIObLvYGE9j+IxTR/aeYyXceZa6EqZhJbhf8gFf/uM03bD/Pv8tzW9/qt01bgOldffRybbF44MBW0+0H0eJP9cnHg2ZsvZoaNmNysBH6x9wQzt9zEPLZRqPwIECuqKQc33zt/aj1ZWNh+podWHuVuePAYlpt5ywKbxGk7NHGQ7vHMyeLCZkkbiIQbvtzjEGokiLoX+hmrYuETvX54wJ9iDPHAAgmO1lJK17t/TAIhCkb7+lr/LOeabV9+J79a+ZGHMrP7LAjB2CKYji91HloA84p76V62YyddxwXu9tiD4b41YV+U9N/4ahY5LudqLA+PusAjRX0wbqJxAoaQ1Br/gpgIrfXFT1eN8DWPkWNH8mu3FYl129ZYO9bl2eNobj6Qbp3KJ8Z6ge8EO3wS44sGnYtDu/0/J1LfwWtolydRQ4pB5ar3SGmXJjEPmpPeccS+l1AvwB3kuJ+wXzaboxbGvCWXHXiqMpfWgN+Mygxqpu/0qdRwGYVmGmwpQkkISJo0PSm3RMQuU9XyAtXuQVbV5tn/euL4ErxNkZQhYjX69QqMEbu9kX14Qhs2pmQTHVktZOf0yq9Y8+6yU/GU8GyrQqAxkEW11zfjAAY5BJ/En5HPDgl7J6zJSPp6pv2PJlKx8yJFW/0/wfalRA55GzEjRJe8FFJYEwYw3CsNDLVHPqmkop9NBPt8LdQUTSA5szPjm7zo6QyJtEHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199018)(122000001)(2906002)(5660300002)(41300700001)(8936002)(52536014)(55016003)(38070700005)(86362001)(33656002)(38100700002)(7696005)(83380400001)(71200400001)(26005)(9686003)(478600001)(186003)(53546011)(6506007)(66574015)(76116006)(66946007)(6916009)(4326008)(8676002)(66556008)(66476007)(66446008)(64756008)(54906003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?IdSFQ4v2GmfVrMBJlDwXYBzT243Tj+Je4BkdX9YvF5PLfzzxHN4l82lWxq?=
 =?iso-8859-2?Q?UJ024A9l4OUx7y5V/pN7+YPdgWKzzEDh/BTrMZu+6SltpN/ycgO6MjW1Ss?=
 =?iso-8859-2?Q?3cZR5M0h1UHqAVAi24O68Q0esWGf4SDcj4Dhrg1U51oWJm1TdfsFiIyYby?=
 =?iso-8859-2?Q?rzwuiQPV3teoGcgCoP5VXsK6C4lGcVTEJgxfUwq51CnU4RFr5EOzsCfzdP?=
 =?iso-8859-2?Q?BGe+xlA4/lkrzc4+/Y0erqwpC6U+WgotAGTookJ2KMSAfb+EDdfqGQAiR9?=
 =?iso-8859-2?Q?XhbuYg8DyHPvhG9zqktaFQhwHMr9PgALZhOwpoKOFBTVoUi0h2a68xc8+7?=
 =?iso-8859-2?Q?vsRauRrFvlQgL1cQMCSua9PuqjwTH0y/Q7dLGS7gcN/JkayPhZXKZkj0RS?=
 =?iso-8859-2?Q?YNqyb9fat7s/9DQPwC7pB2VRvSX5fhy9BVRLC5sRmXGqFyXSsYqJs0IVwz?=
 =?iso-8859-2?Q?+aVqptTG92cZDFQDrh0lMnUeqQ3egMhkX9syY67lbW29M39pD+10vmtK4e?=
 =?iso-8859-2?Q?H3ey3WCX4cRcHfdSi/663I9pfgZaqRDAb2il9F4GPtoqrod/+v+44tsQna?=
 =?iso-8859-2?Q?AKY/appHDabBVjpNI2MtON3nbZNaLNnE3MPvF7qiBVRNpSzd/q7KL5f/2R?=
 =?iso-8859-2?Q?oeI7UivRWw8aON52WxsYxGc5CdxX1RyXEg9hKeZq26MnJ/vRIYcIxUmKyi?=
 =?iso-8859-2?Q?El6qnXcy/DuiAqzLxUlOYTz80/O+WpgFIJBG7DRQg+VyZvcswFGu6K9yGj?=
 =?iso-8859-2?Q?FURnejo9hoA6VnESQV0Rhh5GQy+JExfiBlfRf03eCRAVBAWFTt8U/+EakW?=
 =?iso-8859-2?Q?qcxEy74y8ie69szg5NsdhtydHBX/Z8191Wc7rXQ4RuJUaMncdWd1j2+QFj?=
 =?iso-8859-2?Q?jtrxMzNxIEepcBQWCH+YnlP6RStfwIsAjIogjaLxtl202TFmfIwfFIw+Od?=
 =?iso-8859-2?Q?k9779m8YC4lpQf485KnbUs7820Rmj/QDIJ9x/i335VJLrqCO2TthmOv/sy?=
 =?iso-8859-2?Q?G8nPUuaTlh7yClgErmM/DFLGSw+xQBbFV5w6x3YtOmY7EI4kObS6617bDf?=
 =?iso-8859-2?Q?wto1BPOhKviML32kUGiaRLf7VjOjurSaUk6Yya/fBCagxjQ1NeAeM5e2pn?=
 =?iso-8859-2?Q?gdewGaH55fxGwT/OVxNdDhOjzQrkCnyyElq+rI3XPothCCMjCeIFEjWr8U?=
 =?iso-8859-2?Q?zublZeKdE2XzbLpksTvRxBgyFwi6tfz/2wMRAeJ5flGDv0NKjDn5RI+UHy?=
 =?iso-8859-2?Q?6ISTxVRL7H0eFucCaDNGHepfYH957zo90xf6cLe5585vo9meVyXMYvq9F2?=
 =?iso-8859-2?Q?IelgsBpf/W03e4Ghc0KqgDh1SAzDZj7F8idaS1gJEDW/7VeMQnzH8n8fkD?=
 =?iso-8859-2?Q?u/+b9pms82OcOVWXFurF8TMk2IXs0i5o/WBjZPYJEpt14dNHCmwbG76tYb?=
 =?iso-8859-2?Q?/v+1b3Z/LY4v4Y5vuPVLylzkxIw5PM5qsJERZGVfUxKWAbXVbtoFClbN8k?=
 =?iso-8859-2?Q?obleRkj0WHX0zGyVDlm2/1s2pu7Kg6AJf6jcw4LdUK6xSn18DeuX8EE/eY?=
 =?iso-8859-2?Q?PioIvHldWEFRVjZ7FQhBY/2MfVtb+ReybWJHODOK/GqMX58QQwvWQQteRb?=
 =?iso-8859-2?Q?+PbGYLqSeuoEY=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7593f8e-98fc-4b87-3bb8-08db2ba2fc35
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 13:32:01.8475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2cMf0xg38bzlaMFKlNYxL4lln9c+kfjICCyOxVFR1Vq/aymhh67xoj05Zq0UARjxDEDWut4zwfzzMeHWiEpjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6550
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[Public]



> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Thursday, March 23, 2023 08:06
> To: Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: Jan D=B1bro=B6 <jsd@semihalf.com>; Grzegorz Bernacki
> <gjb@semihalf.com>; Mark Hasemeyer <markhas@chromium.org>; Jarkko
> Nikula <jarkko.nikula@linux.intel.com>; Mika Westerberg
> <mika.westerberg@linux.intel.com>; linux-i2c@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v6 4/4] i2c: designware: Add doorbell support for
> Mendocino
>=20
> On Wed, Mar 22, 2023 at 04:02:26PM -0500, Mario Limonciello wrote:
> > Mendocino and later platform don't use the platform feature mailbox for
> > communication for I2C arbitration, they rely upon ringing a doorbell.
> >
> > Detect the platform by the device ID of the root port and choose the
> > appropriate method.
>=20
> ...
>=20
> > -	ret =3D read_poll_timeout(psp_send_i2c_req_cezanne, status,
> > +	ret =3D read_poll_timeout(_psp_send_i2c_req, status,
> >  				(status !=3D -EBUSY),
>=20
> You can place it now in the above line, but up to you.
>=20
> >  				PSP_I2C_REQ_RETRY_DELAY_US,
> >  				PSP_I2C_REQ_RETRY_CNT *
> PSP_I2C_REQ_RETRY_DELAY_US,
>=20
> ...
>=20
> > +	/* Cezanne uses platform mailbox, Mendocino and later use doorbell
> */
> > +	rdev =3D pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> > +	if (rdev->device =3D=3D 0x1630)
> > +		_psp_send_i2c_req =3D psp_send_i2c_req_cezanne;
> > +	else
> > +		_psp_send_i2c_req =3D psp_send_i2c_req_mendocino;
>=20
> Where is pci_dev_put()?

Missing, thanks for catching it!
